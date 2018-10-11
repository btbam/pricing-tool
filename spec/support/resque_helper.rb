require 'rails_helper'

RSpec.configure do |config|
  config.before(:each, resque: true) do
    ResqueSpec.reset!
  end
end
