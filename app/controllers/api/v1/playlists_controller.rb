# frozen_string_literal: true

module Api
  module V1
    class PlaylistsController < AuthenticationController
      before_action :authenticate_user!
      load_and_authorize_resource :playlist, class: ::Playlist

      def index
        render json: @playlists, status: :ok
      end

      def show
        render json: @playlist, status: :ok
      end

      def create
        playlist = Playlists::CreatePlaylistService.new(
          params[:title],
          params[:screen_id],
          current_user.id
        ).call
        render json: playlist, status: :created
      end

      def update
        Playlists::UpdatePlaylistService.new(params[:id], params[:title]).call
        render json: { message: 'Playlist successfully updated' }, status: :ok
      end

      def destroy
        Playlists::DeletePlaylistService.new(params[:id]).call
        render json: { message: 'Playlist successfully deleted' }, status: :no_content
      end
    end
  end
end
