# frozen_string_literal: true

module Events
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
