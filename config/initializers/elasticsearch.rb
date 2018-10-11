ENV['ES_URL'] = 'localhost' if Rails.env.test?
ENV['ES_INDEX'] ||= 'pricing_tool_' + Rails.env
client = Elasticsearch::Client.new(
  url: ENV['ES_URL'],
  transport_options: {
    request: { timeout: 5 }
  }
)
Elasticsearch::Model.client = client
Elasticsearch::Persistence.client = client
