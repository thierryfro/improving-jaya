class Api::V1::BaseController < ActionController::API
  rescue_from AuthenticationError, with: :not_authorized
  before_action :authenticate

  private

  def authenticate

    if request.headers['X-Hub-Signature'].present?
      # check if token matches
      payload_body = request.body.read
      authenticate_payload(payload_body)

    elsif (request.headers['login'] && request.headers['password']).present?
      # check if token matches
      authenticate_user

    else
      raise AuthenticationError::Unauthorized
    end
  end

  def authenticate_user
    unless (request.headers['password'] && request.headers['login'] == ENV['PASSWORD'])
      raise AuthenticationError::Unauthorized
    end
  end

  def authenticate_payload(payload_body)
    signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['GITHUB_WEBHOOK_KEY'], payload_body)
    return halt 500, "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE'])
  end

  def not_authorized(exception)
    render json: {
      error: exception.message,
      status: 401
    }, status: :unauthorized
  end
end
