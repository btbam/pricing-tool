module ImporterHelper
  # ImportHelper::Text
  class Text < ImporterHelper::Base
    def import(&block)
      # Could not use the CSV class because the file is technically an invalid CSV
      # Note: This task expects database.txt to be located in the root of the application
      csv = File.open(filename)

      csv.first # move the pointer passed the first row of headers
      total_elapsed_time = Benchmark.realtime do
        csv.each_line do |row|
          @iterator += 1
          @data = block.call(row, data, iterator, csv) if block_given?
        end
      end
      logger.debug "total time: #{total_elapsed_time}s"
    end

    def sanitize_city_state_row(row)
      row = scrub_and_split_row(row)

      city_state = scrub_and_split_row(row[2], '-')
      row[2] = city_state[0]
      row[3] = city_state[1]
      row_size = row.size
      if row_size != 4 && row_size != 0
        logger.debug row
        fail 'size not expected'
      end

      row.compact
    end

    private

    # TODO: :reek:UtilityFunction
    def scrub_and_split_row(row, delim = ',')
      row.scrub.split(delim).map(&:strip)
    end
  end
end
