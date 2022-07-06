# frozen_string_literal: true

module Contents
  class RemoveFileService < ApplicationService
    def initialize(file_key)
      @file_key = file_key
    end

    def call
      storage.delete_objects({ delete: { objects: [{ key: @file_key[:file_key] }] } })
    end
  end
end
