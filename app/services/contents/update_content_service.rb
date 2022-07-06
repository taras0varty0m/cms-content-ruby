# frozen_string_literal: true

module Contents
  class UpdateContentService < ApplicationService
    def initialize(id, file_key)
      @id = id
      @file_key = file_key
    end

    def call
      @content = ::Content.find @id

      @content.file_key = @file_key if @file_key.present?

      @content.save!
    end
  end
end
