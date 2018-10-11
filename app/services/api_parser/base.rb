module ApiParser
  # ApiParser::Base
  class Base
    attr_accessor :url, :meta_url, :meta_data, :raw_feed

    def initialize(opts = {})
      @url = to_uri(opts[:url])
      @timeout = 3
    end

    def logger
      Rails.logger
    end

    def parse
      []
    end

    def fetch
      @raw_feed ||= APICache.get(url, cache: 1800, timeout: @timeout, period: 0) do
        logger.debug "ACTUALLY HITTING THE API: #{url}"
        response = HTTParty.get(url)
        case response.code
        when 200 then response.body
        else fail APICache::InvalidResponse
        end
      end
    rescue
      logger.info "Service is down or unreachable at #{url}"
      @success = false
    end

    def success?
      @success.present?
    end

    def meta_data
      @meta_data ||= MetaInspector.new(meta_url) if meta_url
    rescue Faraday::ConnectionFailed
      logger.info "MetaInspector failed on #{meta_url}"
      @meta_data
    end

    private

    def to_uri(value)
      URI(value).normalize.to_s if value
    end

    # TODO: :reek:UtilityFunction
    def queryize(string)
      CGI.escape(string.to_s.strip.gsub(/\s+/, ' '))
    end

    # TODO: :reek:UtilityFunction
    def strip_common_terms(string)
      common_terms = /\s*(, )?(inc|llc|corp)\.?\s*$/i
      string.gsub(common_terms, '')
    end
  end
end
