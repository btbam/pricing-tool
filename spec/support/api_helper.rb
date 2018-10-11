require 'rails_helper'

RSpec.shared_context 'api helper cleanup' do
  after { Grape::Endpoint.before_each nil }
end

RSpec.shared_context 'logged in with privileges' do
  let!(:valid_user) { create(:user) }

  before do
    Grape::Endpoint.before_each do |endpoint|
      allow(endpoint).to receive(:authenticated).and_return(true)
      allow(endpoint).to receive(:current_user).and_return(valid_user)
      allow(endpoint).to receive(:can?).and_return(true)
    end
  end

  include_context 'api helper cleanup'
end

RSpec.shared_context 'logged in without privileges' do
  let!(:valid_user) { create(:user) }

  before do
    Grape::Endpoint.before_each do |endpoint|
      allow(endpoint).to receive(:authenticated).and_return(true)
      allow(endpoint).to receive(:current_user).and_return(valid_user)
      allow(endpoint).to receive(:can?).and_return(false)
    end
  end

  include_context 'api helper cleanup'
end
