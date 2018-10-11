# LoadTester
class LoadTester
  require 'etl'

  attr_accessor :thread_pool, :company_names, :es_repo, :benchmark_times, :load_hits

  def logger
    @logger ||= Logger.new(STDOUT)
  end

  def initialize(**opts)
    @thread_pool = ::ETL::ThreadPool.new(opts[:thread_pool_count] || 10)
    @company_names = opts[:company_names] || generate_fake_company_names
    @es_repo = opts[:es_repo] || CompanyRepository.new
    @benchmark_times = []
    @load_hits = opts[:load_hits] || 100
  end

  def run(&block)
    Benchmark.realtime do
      load_hits.times do |num|
        thread_run(num, &block)
      end
    end
    thread_pool.shutdown
    logger.info "@benchmark_times: #{@benchmark_times.sort}"
    logger.info "total_time = #{@benchmark_times.reduce(:+)}"
  end

  def thread_run(num, &block)
    thread_pool.schedule do
      block_time = Benchmark.realtime do
        block.call(es_repo, company_names) if block_given?
      end
      logger.info "#{num}: #{block_time}"
      @benchmark_times << block_time
    end
  end

  private

  def generate_fake_company_names
    ["applebee's", "denny's", 'abc liquor', 'apple', 'baskin robbins', 'bing', 'burger joint', 'case study',
     'cloudspace', 'consolidated', 'cumberbun', 'dracon', 'factory title', 'fiddler', 'financial', 'google',
     'happy camp', 'henderson', 'higher', 'holdings', 'hot dog', 'irish place', 'killer food' 'microsoft', 'nemesis',
     'nextly', 'opener', 'over hauling', 'overly business', 'overtly over', 'pivotal', 'red robin', 'scholastic',
     'sendgrid', 'ski resort', 'smith farm', 'smooth sailing', 'space company', 'target', 'uber', 'vodka', 'walmart',
     'yahoo']
  end
end
