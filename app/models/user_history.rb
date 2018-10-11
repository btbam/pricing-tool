class UserHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :company_info, class_name: 'CompanyInfo', primary_key: :duns_number, foreign_key: :duns_number
  belongs_to :user_history_do, class_name: ::UserHistory::Do, primary_key: :id, foreign_key: :user_history_do_id
  belongs_to :user_history_epli, class_name: ::UserHistory::Epli, primary_key: :id, foreign_key: :user_history_epli_id

  attr_accessor :name

  scope :by_user, ->(user_id) { where(user_id: user_id) }
  scope :by_duns, ->(duns_number) { where(duns_number: duns_number) }

  validates :user_id, uniqueness: { scope: :duns_number }

  accepts_nested_attributes_for :user_history_do
  accepts_nested_attributes_for :user_history_epli

  def self.find_by_user_and_duns(user_id, duns_number)
    by_user(user_id).by_duns(duns_number).first
  end
end
