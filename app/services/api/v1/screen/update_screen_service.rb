# frozen_string_literal: true

module Api
  module V1
    module Screen
      class UpdateScreenService < ApplicationService
        def initialize(id, name)
          @id = id
          @name = name
        end

        def call
          @screen = ::Screen.find @id

          @screen.name = @name if @name.present?

          @screen.save!
        end
      end
    end
  end
end
