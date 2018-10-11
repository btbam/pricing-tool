# CompareHelper
module CompareHelper
  extend ActiveSupport::Concern

  included do
    scope :select_distinct, ->(fields) { select(fields).group(fields).order(fields) }
  end
end
