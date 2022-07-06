# frozen_string_literal: true

module PlaylistContents
  class CreatePlaylistContentService < ApplicationService
    def initialize(duration, priority, playlist_id, content_id, user_id)
      @duration = duration
      @priority = priority
      @playlist_id = playlist_id
      @content_id = content_id
      @user_id = user_id
    end

    def call
      ::PlaylistContent.create!(
        duration: @duration,
        priority: @priority,
        playlist_id: @playlist_id,
        content_id: @content_id,
        user_id: @user_id
      )
    end
  end
end
