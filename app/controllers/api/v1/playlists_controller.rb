# frozen_string_literal: true

module Api
  module V1
    class PlaylistsController < AuthenticationController
      before_action :authenticate_user!
      load_and_authorize_resource

      def index
        render json: ::Playlist.all, status: :ok
      end

      def show
        playlist = ::Playlist.find params[:id]
        render json: playlist, status: :ok
      end

      def create
        playlist = Api::V1::Playlist::CreatePlaylistService.new(
          params[:title],
          params[:screen_id],
          current_user.id
        ).call
        render json: playlist, status: :created
      end

      def update
        Api::V1::Playlist::UpdatePlaylistService.new(params[:id], params[:title]).call
        render json: { message: 'Playlist successfully updated' }, status: :ok
      end

      def destroy
        Api::V1::Playlist::DeletePlaylistService.new(params[:id]).call
        render json: { message: 'Playlist successfully deleted' }, status: :no_content
      end
    end
  end
end
