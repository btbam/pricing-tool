module Platform
  module Helpers
    module UserHelpers
      extend Grape::API::Helpers

      def warden
        env['warden']
      end

      def user_via_api
        auth = AuthToken.valid?(headers['Authorization'].split(' ').last)
        return unless auth
        jwt = auth.first
        user = ::User.where(id: jwt['user_id']).first
        user if user && user.validate_session(jwt['session_token'])
      rescue
        nil
      end

      def authenticated
        # XXX: return true
        if warden.authenticated?
          return true
        else
          return true if user_via_api
          error!('401 Unauthorized', 401, 'X-Error-Detail' => 'User not logged in')
        end
      end

      def current_user
        warden.user || user_via_api
      end

      def admin?
        current_user && current_user.is_admin?
      end
      alias_method :is_admin?, :admin?

      def executive?
        current_user && current_user.executive?
      end
      alias_method :is_executive?, :executive?

      # returns 401 if there's no current user
      def authenticated_user
        authenticated
        error!('401 Unauthorized', 401) unless current_user
      end

      # returns 401 if not authenticated as admin
      def authenticated_admin
        authenticated
        error!('401 Unauthorized', 401) unless is_admin?
      end

      # This is only run in development mode due an error with the
      # models not being pre-loaded properly. In production, the models
      # are cached by the server and this is not a problem
      def preload_models
        return if Rails.env.production?
        ['app/models'].each do |path|
          preload_path(path)
        end
        Track
      end

      def preload_path(path)
        Dir["#{Rails.root}/#{path}/*.rb"].each do |file|
          require_dependency file
        end
      end

      # cancancan methods that get included in controllers
      def authorize!(*args)
        # you already implement current_user helper :)
        ::Ability.new(current_user).authorize!(*args)
      end

      def can?(*args)
        ::Ability.new(current_user).can?(*args)
      end

      # Caching methods
      # TODO: potentially move these caching methods to a separate "caching" mixin

      def default_expires
        expires_at(Time.zone.tomorrow + 7.hours + 30.minutes)
      end

      # TODO: :reek:UtilityFunction
      def expires_at(datetime)
        (datetime - Time.zone.now).to_i
      end

      def default_cache_race_ttl
        10
      end

      def caching_namespace
        "algl-us-#{ENV['CACHING_NAMESPACE_KEY']}"
      end

      def cache_config
        {
          expires_in: default_expires,
          race_condition_ttl: default_cache_race_ttl,
          namespace: caching_namespace
        }
      end
    end
  end
end
