module Platform
  # rubocop:disable ClassLength
  class User < API
    helpers Platform::Helpers::SearchHelpers

    before do
      authenticated_user
    end

    resource :user do
      resource :history do
        get do
          current_user.recent_history_display
        end

        params do
          requires :duns_number, type: Integer
        end
        delete ':duns_number' do
          response = {}
          history = current_user.user_histories.find_by_duns_number(params[:duns_number])
          if history
            history.destroy
            response = { duns_number: history.duns_number, response: 'deleted' }
          else
            error!('Entity not found in history.', 404)
          end
          response[:history] = current_user.recent_history_display
          response
        end

        params do
          requires :duns_number, type: Integer
        end
        get ':duns_number' do
          user_history = UserHistory.where(duns_number: params[:duns_number], user_id: current_user.id)
                         .where.not(user_history_do_id: nil, user_history_epli_id: nil).first
          user_history ? JSON.parse(UserHistorySerializer.new(user_history).to_json) : {}
        end
      end
    end
  end
end
