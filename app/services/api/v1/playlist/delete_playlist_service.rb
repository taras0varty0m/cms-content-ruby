# frozen_string_literal: true

module Api
  module V1
    module Playlist
      class DeletePlaylistService < ApplicationService
        def initialize(id)
          @id = id
        end

        def call
          @playlist = ::Playlist.find @id

          @playlist.destroy!
        end
      end
    end
  end
end
