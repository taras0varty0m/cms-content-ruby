# frozen_string_literal: true

module Events
  class UpdateEventService < ApplicationService
    def initialize(id, title)
      @id = id
      @title = title
    end

    def call
      @event = ::Event.find @id

      @event.title = @title if @title.present?

      @event.save!
    end
  end
end
