module Platform
  module Helpers
    module SearchHelpers
      extend Grape::API::Helpers

      # :reek:UtilityFunction
      def process_opts(**opts)
        opts[:size] = opts[:size].to_i if opts.key?(:size)
        opts[:from] = opts[:from].to_i if opts.key?(:from)
        opts
      end

      def try_search(query, **opts)
        repo = CompanyRepository.new
        begin
          repo.autocomplete_search(query, process_opts(opts))
        rescue
          logger = Rails.logger
          logger.error("#{$ERROR_INFO.class} (#{$ERROR_INFO.message}):")
          logger.error("  #{$ERROR_POSITION.join("\n  ")}\n")
          error!('Service Unavailable', 503)
        end
      end
    end
  end
end
