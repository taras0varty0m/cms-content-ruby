# frozen_string_literal: true

module Api
  module V1
    module Event
      class CreateEventService < ApplicationService
        def initialize(title, user_id)
          @title = title
          @user_id = user_id
        end

        def call
          ::Event.create!(title: @title, user_id: @user_id)
        end
      end
    end
  end
end
