class CompanyRepository
  include Elasticsearch::Persistence::Repository

  index ENV['ES_INDEX']
  type 'companies'

  klass Company

  settings number_of_replicas: 0, analysis: {
    analyzer: {
      autocomplete: {
        type: 'custom',
        tokenizer: 'standard',
        filter: %w(lowercase autocomplete_filter)
      }
    },
    filter: {
      autocomplete_filter: {
        type: 'edge_ngram',
        min_gram: 3,
        max_gram: 20,
        token_chars: %w(letter digit)
      }
    }
  } do
    mappings do
      indexes :duns_number, type: 'multi_field', path: 'just_name' do
        indexes :duns_number, type: 'integer', index: 'analyzed'
        indexes :duns_string, type: 'string', index: 'not_analyzed'
      end
      indexes :name, type: 'multi_field' do
        indexes :name, type: 'string', tokenizer: 'keyword', filter: 'lowercase'
        indexes :autocomplete, analyzer: 'autocomplete'
      end
      indexes :sic_code, type: 'multi_field', path: 'just_name' do
        indexes :sic_code, type: 'integer', index: 'analyzed'
        indexes :sic_string, type: 'string', index: 'not_analyzed'
      end
      indexes :sic_code_first, type: 'string', index: 'not_analyzed'
      indexes :full_address, type: 'string', tokenizer: 'keyword', filter: 'lowercase'
      indexes :street_address, type: 'string', tokenizer: 'keyword', filter: 'lowercase'
      indexes :city, type: 'multi_field' do
        indexes :city, type: 'string', tokenizer: 'keyword', filter: 'lowercase'
        indexes :autocomplete, analyzer: 'autocomplete'
      end
      indexes :state, type: 'string', tokenizer: 'keyword', filter: 'lowercase'
      indexes :zip_code, type: 'string', tokenizer: 'keyword', filter: 'lowercase'
      indexes :zip_code5, type: 'string', tokenizer: 'keyword', filter: 'lowercase'
      indexes :sales_volume, type: 'long', index: 'analyzed'
      indexes :global_employee_total, type: 'long', index: 'analyzed'
      indexes :customer, type: 'integer', index: 'analyzed'
      indexes :tree_pos, type: 'integer', index: 'analyzed'
      indexes :large_line_no, type: 'long', index: 'analyzed'
      indexes :small_line_no, type: 'long', index: 'analyzed'
    end
  end

  def find_by_duns(duns)
    search(query: { term: { duns_number: duns } }).first
  end

  def find_by_name(name)
    search(query: { match_phrase: { name: name } }).first
  end

  def find_by_duns_array(duns_array)
    search(query: { terms: { duns_number: duns_array } }, size: 11)
  end

  # :reek:BooleanParameter
  def find_by_keywords(query, from: 0, size: 6, customer: true, **opts)
    sort = ['_score']
    sort.unshift(customer: :desc) if customer
    search(
      from: from,
      size: size,
      track_scores: true,
      query: {
        function_score: {
          query: {
            multi_match: {
              analyzer: :standard,
              query: query,
              type: :cross_fields,
              operator: :and,
              fields: ['name.autocomplete', 'street_address', 'city', 'state',
                       'zip_code', 'zip_code5']
            }
          },
          functions: [{ script_score: script_score(opts[:score_option]) }],
          boost_mode: :replace
        }
      },
      sort: sort
    )
  end

  def autocomplete_search(query, **opts)
    query = query.to_s.strip.downcase
    results = []
    return results if query.length < 3
    results = Array(find_by_duns(query.to_i)) if numeric?(query)
    results = Array(find_by_keywords(query, opts)) if results.empty?
    results
  end

  # TODO: Update if we get new data
  MAX_SALES_VOLUME = 476_294_000_000
  MAX_GLOBAL_EMPLOYEE_TOTAL = 7_779_209

  # normalized sales_volume
  def sales_volume_score
    "doc['sales_volume'].value / #{MAX_SALES_VOLUME}"
  end

  # normalized global_employee_total
  def global_employee_total_score
    "doc['global_employee_total'].value / #{MAX_GLOBAL_EMPLOYEE_TOTAL}"
  end

  # prefer 1 (top hq) > 4 (single location) > other values
  def tree_pos_score
    "doc['tree_pos'].value == 1 ? 2 : (doc['tree_pos'].value == 4 ? 1 : 0)"
  end

  def field_score_script(field)
    field_score_method = "#{field}_score".to_sym
    "#{send(field_score_method)} * (int)_score" if respond_to?(field_score_method)
  end

  def default_score_script
    [
      field_score_script(:sales_volume),
      field_score_script(:global_employee_total)
    ].compact.join(' + ')
  end

  def script_score(option)
    {
      script: field_score_script(option) || default_score_script,
      lang: :groovy
    }
  end

  def numeric?(value)
    self.class.numeric?(value)
  end

  def self.numeric?(value)
    Float(value) rescue false
  end
end
