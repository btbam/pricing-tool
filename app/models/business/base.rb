module Business::Base
  extend ActiveSupport::Concern

  included do
    has_many :compares

    scope :by_name, ->(name) { where(name: name) }
  end

  module ClassMethods
    def table_name_prefix
      'business_'
    end

    def find_by_name(name)
      by_name(name).first
    end
  end
end
