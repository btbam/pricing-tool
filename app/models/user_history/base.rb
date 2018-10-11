module UserHistory::Base
  extend ActiveSupport::Concern

  module ClassMethods
    def table_name_prefix
      'user_history_'
    end
  end
end
