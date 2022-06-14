# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken
      include ActionController::RequestForgeryProtection
      protect_from_forgery with: :exception
      skip_before_action :verify_authenticity_token

      alias authenticate_user! authenticate_api_v1_user!
      alias current_user current_api_v1_user
    end
  end
end
