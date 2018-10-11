module Platform
  # Platform::API
  class API < Grape::API
    prefix 'api'
    version 'v1', using: :header, vendor: 'platform'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers Platform::Helpers::UserHelpers

    helpers Platform::Helpers::GeneralHelpers

    get '/' do
      if current_user
        JSON.parse(::User.find(current_user.id).to_json)
      else
        JSON.parse({}.to_json)
      end
    end

    mount Platform::Company
    mount Platform::User
    mount Platform::Auth
    mount Platform::Demo
    mount Platform::Status
    mount Platform::Comparables

    route :any, '*path' do
      error!('404 Not Found', 404)
    end
  end
end
