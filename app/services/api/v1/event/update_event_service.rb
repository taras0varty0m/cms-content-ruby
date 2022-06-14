# frozen_string_literal: true

module Api
  module V1
    module Event
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
  end
end
