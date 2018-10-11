module ImporterHelper
  # ImporterHelper::Base
  class Base
    attr_accessor :data, :iterator, :columns, :filename, :logger, :skip_headers

    def initialize(opts = {})
      @filename = opts[:filename]
      @data = opts[:data] || []
      @iterator = opts[:iterator] || 0
      @columns = opts[:columns] || []
      @skip_headers = opts[:skip_headers] || false

      @logger = Logger.new(STDOUT)
      @logger.level = Logger::INFO
    end

    # TODO: is this method actually used?
    def if_nil(value, &block)
      block.call(value) if value && block_given?
    end
  end
end
