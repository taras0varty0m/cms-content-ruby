# frozen_string_literal: true

module Api
  module V1
    module PlaylistContent
      class DeletePlaylistContentService < ApplicationService
        def initialize(id)
          @id = id
        end

        def call
          @playlist_content = ::PlaylistContent.find @id

          @playlist_content.destroy!
        end
      end
    end
  end
end
