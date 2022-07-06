# frozen_string_literal: true

module PlaylistContents
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
