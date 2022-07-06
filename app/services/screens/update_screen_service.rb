# frozen_string_literal: true

module Screens
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
