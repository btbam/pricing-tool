class Compare::Industry < ActiveRecord::Base
  include Compare::Base
  include IndustryAverageCleaner
end
