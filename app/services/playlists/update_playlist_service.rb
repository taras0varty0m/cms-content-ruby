# frozen_string_literal: true

module Playlists
  class UpdatePlaylistService < ApplicationService
    def initialize(id, title)
      @id = id
      @title = title
    end

    def call
      @playlist = ::Playlist.find @id

      @playlist.title = @title if @title.present?

      @playlist.save!
    end
  end
end
