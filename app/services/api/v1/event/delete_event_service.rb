# frozen_string_literal: true

module Api
  module V1
    module Event
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
  end
end
