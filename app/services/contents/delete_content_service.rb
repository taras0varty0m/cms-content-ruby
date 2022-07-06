# frozen_string_literal: true

module Contents
  class DeleteContentService < ApplicationService
    def initialize(id)
      @id = id
    end

    def call
      @content = ::Content.find @id

      @content.destroy!
    end
  end
end
