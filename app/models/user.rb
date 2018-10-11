# User
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :reset_session

  has_many :user_histories

  def recent_history(count = 6)
    user_histories.order(updated_at: :desc).limit(count)
  end

  def recent_history_display(count = 6)
    CompanyInfo.es_with_name(recent_history(count)).map do |policy|
      {
        duns_number: policy.duns_number,
        name: policy.name
      }
    end
  end

  def reset_session
    session_token = SecureRandom.hex(64)
    update(session_token: session_token)
    session_token
  end

  def validate_session(session_token)
    self.session_token == session_token
  end
end
