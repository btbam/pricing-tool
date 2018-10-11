module ApiParser
  # ApiParser::Google
  # :reek:TooManyInstanceVariables
  class Google < Base
    RESULTS_PER_PAGE = 20

    attr_accessor :query, :query_params, :page, :previous_page, :next_page, :results_total, :results_time

    def initialize(opts = {})
      @query = queryize(opts[:query]) || ''
      @query_params = params_string(opts[:query_params])
      @page = [opts[:page].to_i, 1].max
      super url: full_url
    end

    def start
      (page - 1) * RESULTS_PER_PAGE
    end

    def num
      RESULTS_PER_PAGE
    end

    def pages_total
      return 0 unless results_total.to_i > 0
      (results_total.to_f / RESULTS_PER_PAGE).ceil
    end

    def full_url
      root_url + url_params + query_url
    end

    def root_url
      'http://www.google.com/cse'
    end

    def url_params
      cx = ENV["GOOGLE_SEARCH_KEY_#{Rails.env.upcase}"]
      "?cx=#{cx}&client=google-csbe&output=xml_no_dtd&ie=utf8&oe=utf8&start=#{start}&num=#{num}&#{query_params}"
    end

    def query_url
      params_string q: query
    end

    def self.fetch_and_parse(opts = {})
      api = ApiParser::Google.new(opts)
      api.fetch_and_parse
      api
    end

    def fetch_and_parse
      @raw_feed = APICache.get(full_url, cache: 1800, timeout: 10, period: 0) do
        logger.debug "ACTUALLY HITTING THE API: #{query}"
        fetch
      end
      parse
    rescue APICache::APICacheError
      @success = false
      raise
    end

    def raw_feed_xml
      @raw_feed_xml ||= Nokogiri::XML(raw_feed)
    end

    def parse
      return [] unless raw_feed_xml
      parse_meta
      @fz_feed_parser ||= parse_array(raw_feed_xml.css('R')).map do |result|
        {
          title: parse_and_sanitize_text(result.css('T')),
          url: parse_text(result.css('U')),
          date: parse_posix(result.css('BYLINEDATE')),
          description: parse_and_sanitize_text(result.css('S'))
        }
      end
    end

    def entries
      parse
    end

    private

    def parse_meta
      @previous_page ||= parse_text(raw_feed_xml.css('PU'))
      @next_page ||= parse_text(raw_feed_xml.css('NU'))
      @results_total ||= parse_integer(raw_feed_xml.css('M'))
      @results_time ||= parse_float(raw_feed_xml.css('TM'))
    end

    # TODO: :reek:UtilityFunction
    def parse_array(node)
      node || []
    end

    # TODO: :reek:UtilityFunction
    def parse_integer(node)
      parse_text(node).to_i
    end

    # TODO: :reek:UtilityFunction
    def parse_float(node)
      parse_text(node).to_f
    end

    # TODO: :reek:UtilityFunction
    def parse_text(node)
      node ? node.text : ''
    end

    # TODO: :reek:UtilityFunction
    def parse_and_sanitize_text(node)
      text = parse_text(node)
      CGI.unescapeHTML(ActionView::Base.full_sanitizer.sanitize(text))
    end

    # TODO: :reek:UtilityFunction
    def parse_posix(node)
      Time.at(node ? node.text.to_i : 0).utc.to_datetime
    end

    # TODO: :reek:UtilityFunction
    def params_string(query_params = {})
      query_params = {} unless query_params.is_a? Hash
      query_params.reduce('') { |sum, (key, value)| sum + "&#{URI.encode(key.to_s)}=#{URI.encode(value.to_s)}" }
    end
  end
end
