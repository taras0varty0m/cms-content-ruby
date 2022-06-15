# frozen_string_literal: true

module Api
  module V1
    module Playlist
      class CreatePlaylistService < ApplicationService
        def initialize(title, screen_id, user_id)
          @title = title
          @screen_id = screen_id
          @user_id = user_id
        end

        def call
          ::Playlist.create!(title: @title, screen_id: @screen_id, user_id: @user_id)
        end
      end
    end
  end
end
