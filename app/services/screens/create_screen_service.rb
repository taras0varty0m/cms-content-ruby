# frozen_string_literal: true

module Screens
  class CreateScreenService < ApplicationService
    def initialize(name, event_id, user_id)
      @name = name
      @event_id = event_id
      @user_id = user_id
    end

    def call
      ::Screen.create!(name: @name, event_id: @event_id, user_id: @user_id)
    end
  end
end
