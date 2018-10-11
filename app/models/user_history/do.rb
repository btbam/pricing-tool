class UserHistory::Do < ActiveRecord::Base
  include UserHistory::Base

  has_one :user_history, class_name: 'UserHistory', primary_key: :id, foreign_key: :user_history_do_id
end
