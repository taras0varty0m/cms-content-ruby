# frozen_string_literal: true

module Api
  module V1
    module PlaylistContent
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
  end
end
