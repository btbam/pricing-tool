# AuthToken
class AuthToken
  def initialize(opts = {})
    @payload = opts[:payload]
    @token = opts[:token]
  end

  def issue_token
    @payload[:exp] = expiration if @payload
    @token = JWT.encode(@payload, secret)
  end

  def valid?
    JWT.decode(@token, secret) rescue false
  end

  def self.issue_token(opts = {})
    auth_token = AuthToken.new(opts)
    auth_token.issue_token
  end

  def self.valid?(token)
    auth_token = AuthToken.new(token: token)
    auth_token.valid?
  end

  private

  def expiration
    @expiration ||= 30.minutes.from_now.to_i
  end

  def secret
    Rails.application.secrets.secret_key_base
  end
end
