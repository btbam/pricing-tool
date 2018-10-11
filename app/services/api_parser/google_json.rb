module ApiParser
  class GoogleJSON < Base
    RESULTS_PER_PAGE = 10

    attr_accessor :query, :query_params, :page, :results_total, :results_time, :news_only

    def initialize(**opts)
      @query = strip_common_terms(opts[:query])
      @page = [opts[:page].to_i, 1].max
      @news_only = opts[:news_only]
      super url: full_url
    end

    def pages_total
      return 0 unless results_total.to_i > 0
      (results_total.to_f / num).ceil
    end

    def self.fetch_and_parse(opts = {})
      api = new(opts)
      api.fetch_and_parse
      api
    end

    def fetch_and_parse
      fetch
      parse
    end

    def parse
      return [] unless valid_raw_feed?
      parse_meta
      @fz_feed_parser ||= raw_feed_json['items'].map do |result|
        {
          title: result['title'],
          url: result['link'],
          date: parse_date(result).utc.to_datetime,
          description: result['snippet']
        }
      end
    end

    def entries
      parse
    end

    private

    def valid_raw_feed?
      raw_feed_json && raw_feed_json['items']
    end

    def raw_feed_json
      @raw_feed_json = JSON.parse(fetch)
    rescue
      logger.info "There was a problem parsing the feed at #{url}."
      @success = false
    end

    def root_url
      'https://www.googleapis.com/customsearch/v1'
    end

    def full_url
      full_url = URI.parse(root_url)
      full_url.query = [url_params, query_params, i18n_params].inject(&:merge).to_query
      full_url.to_s
    end

    def url_params
      {
        cx: cx,
        key: api_key
      }
    end

    def query_params
      {
        q: "\"#{query}\"",
        num: num,
        start: start,
        sort: 'date'
      }
    end

    def i18n_params
      {
        cr: 'countryUS',
        lr: 'lang_en',
        gl: 'us',
        hl: 'en'
      }
    end

    def start
      (page - 1) * num + 1
    end

    def num
      RESULTS_PER_PAGE
    end

    def parse_date(result)
      metatags = result['pagemap'].try(:[], 'metatags').try(:first)
      words = result['snippet'].split(' ... ').first

      date = parse_date_from_metatags(metatags)
      date ||= parse_offset_from_words(words)
      # rubocop:disable RescueModifier
      date ||= Time.parse(words) rescue nil
      # rubocop:enable RescueModifier
      date || Time.now
    end

    ##
    # Look for specific metatags and try to parse the date.
    # TODO: :reek:UtilityFunction
    #
    def parse_date_from_metatags(metatags)
      return unless metatags
      # rubocop:disable RescueModifier
      date = Time.parse(metatags['pubdate']) rescue nil
      date || Time.parse(metatags['revision_date']) rescue nil
      # rubocop:enable RescueModifier
    end

    ##
    # Parse words for an offset and return the appropriate datetime.
    #
    # Expect the beginning of the string to have a phrase, e.g., "6 hours ago",
    # that describes the offset. Using this string, determine the appropriate
    # datetime.
    #
    # TODO: :reek:UtilityFunction
    #
    def parse_offset_from_words(words)
      words = words.to_s.split
      count = words[0].to_i
      return if count == 0

      units = words[1].to_sym
      return unless count.respond_to?(units)

      offset = count.send(units)
      Time.now - offset
    end

    def parse_meta
      info = raw_feed_json.try(:[], 'searchInformation')
      return unless info.is_a?(Hash)

      @results_total ||= info['totalResults'].to_i
      @results_time ||= info['searchTime']
    end

    def cx
      key_type = "#{Rails.env.upcase}"
      @cx ||  news_only ? ENV['GOOGLE_SEARCH_KEY_NEWS_' + key_type] : ENV['GOOGLE_SEARCH_KEY_' + key_type]
    end

    def api_key
      @api_key ||= ENV['GOOGLE_API_KEY']
    end
  end
end
