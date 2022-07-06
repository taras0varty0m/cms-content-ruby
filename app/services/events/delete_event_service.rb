# frozen_string_literal: true

module Events
  class DeleteEventService < ApplicationService
    def initialize(id)
      @id = id
    end

    def call
      @event = ::Event.find @id

      @event.destroy!
    end
  end
end
