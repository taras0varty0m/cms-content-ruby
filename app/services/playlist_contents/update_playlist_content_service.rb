# frozen_string_literal: true

module PlaylistContents
  class UpdatePlaylistContentService < ApplicationService
    def initialize(id, duration, priority)
      @id = id
      @duration = duration
      @priority = priority
    end

    def call
      @playlist_content = ::PlaylistContent.find @id

      @playlist_content.duration = @duration if @duration.present?
      @playlist_content.priority = @priority if @priority.present?

      @playlist_content.save!
    end
  end
end
