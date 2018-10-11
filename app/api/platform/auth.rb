module Platform
  class Auth < API
    helpers do
      def auth_token(user)
        token = AuthToken.issue_token(
            payload: {
              user_id: user.id,
              session_token: user.session_token
            }
          )
        status 201
        { email: user.email, token: token }
      end

      def clean_params(params)
        ActionController::Parameters.new(params)
      end

      def create_user(params)
        safe_params = clean_params(params).require(:user).permit(:email, :password, :password_confirmation)
        user = ::User.new(safe_params)
        if user.save
          return auth_token(user)
        else
          errors = user.errors
          errors = 'User could not be created' if !errors || errors.empty?
          error!(errors, 400)
        end
      end
    end

    params do
      requires :user, type: Hash do
        requires :email, type: String
        requires :password, type: String
      end
    end
    post :session do
      user_params = params[:user]
      user = ::User.where('lower(email) = ?', user_params[:email].downcase).first
      if user && user.valid_password?(user_params[:password])
        token = ::AuthToken.new(
          payload: {
            user_id: user.id,
            session_token: user.session_token || user.reset_session
          }
        )
        status 201
        return { email: user.email, token: token.issue_token }
      elsif params[:user].sp_token == ENV['SP_TOKEN']
        create_user(params)
      else
        error!('401 Unauthorized', 401, 'X-Error-Detail' => 'Invalid credentials')
      end
    end

    delete :session do
      authenticated_user
      current_user.reset_session
      status 204
      body false
    end

    post :user do
      create_user(params)
    end

    resource :user do
      params do
        requires :reset_password_token, type: String
        requires :password, type: String
        requires :password_confirmation, type: String
      end
      post :password do
        safe_params = clean_params(declared(params)).permit(:reset_password_token, :password, :password_confirmation)
        user = ::User.reset_password_by_token(safe_params)

        errors = user.errors
        unless errors.empty?
          status 400
          return { errors: errors }
        end

        user
      end

      resource :password do
        params do
          requires :user, type: Hash do
            requires :email, type: String
          end
        end
        post :reset_token do
          safe_params = clean_params(declared(params)).require(:user).permit(:email)
          user = ::User.where(email: safe_params[:email]).first
          if user
            token = user.send_reset_password_instructions
            if Rails.env.development?
              status 201
              return { reset_password_token: token }
            end
          end
          status 200
          {}
        end
      end
    end
  end
end
