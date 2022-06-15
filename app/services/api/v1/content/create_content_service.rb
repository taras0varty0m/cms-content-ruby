# frozen_string_literal: true

module Api
  module V1
    module Content
      class CreateContentService < ApplicationService
        def initialize(file_key, user_id)
          @file_key = file_key
          @user_id = user_id
        end

        def call
          ::Content.create!(file_key: @file_key, user_id: @user_id)
        end
      end
    end
  end
end
