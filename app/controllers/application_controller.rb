include ActionController::HttpAuthentication::Token::ControllerMethods
class ApplicationController < ActionController::API
    before_action :authenticate_user
    require 'jwt'

    def authenticate_user
      if request.headers['Authorization'].present?
        authenticate_or_request_with_http_token do |token|
          begin
            jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
            @current_user_id = jwt_payload['id']
            current_user
          rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
            head :unauthorized
          end
        end
      else
        begin
          raise Exception.new "You need to login!"
        rescue Exception => e
          render json: { error: e.message }
        end
      end

    end

    def current_user
      @current_user ||= User.find(@current_user_id)
    end

    def signed_in?
      @current_user_id.present?
    end

    def only_admin
      if @current_user && @current_user.is_admin?
        return true
      end

      begin
        raise Exception.new "Only admin can access!"
      rescue Exception => e
        render json: { error: e.message }
      end
    end
end
