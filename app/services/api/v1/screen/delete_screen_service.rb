# frozen_string_literal: true

module Api
  module V1
    module Screen
      class DeleteScreenService < ApplicationService
        def initialize(id)
          @id = id
        end

        def call
          @screen = ::Screen.find @id

          @screen.destroy!
        end
      end
    end
  end
end
