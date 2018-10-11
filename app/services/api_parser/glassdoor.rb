module ApiParser
  # ApiParser::Glassdoor
  class Glassdoor < Base
    attr_accessor :glassdoor_url, :glassdoor_description

    def initialize(opts = {})
      super url: root_url + query_url(opts[:company])
    end

    def root_url
      params = [
        "t.p=#{ENV['GLASSDOOR_API_ID']}",
        "t.k=#{ENV['GLASSDOOR_API_KEY']}",
        'userip=0.0.0.0',
        'useragent=',
        'format=json',
        'v=1',
        'action=employers',
        'pn=1',
        'ps=1'
      ]
      "http://api.glassdoor.com/api/api.htm?#{params.join('&')}"
    end

    def query_url(company)
      params = [
        "q=#{URI.encode(company.name)}",
        "city=#{URI.encode(company.city)}",
        "state=#{URI.encode(company.state)}"
      ]
      '&' + params.join('&')
    end

    def set_company_data
      @raw_feed = JSON.parse(fetch)
      return if bad_url?(raw_feed)
      @glassdoor_url = 'http://' + raw_feed['response']['employers'][0]['website']
    rescue
      logger.info "There was a problem parsing the feed at #{url}."
      @success = false
    end

    private

    # TODO: :reek:UtilityFunction
    def bad_url?(raw_feed)
      !raw_feed.try(:[], 'response').try(:[], 'employers').try(:[], 0) ||
        raw_feed['response']['employers'][0]['website'] == ''
    end
  end
end
