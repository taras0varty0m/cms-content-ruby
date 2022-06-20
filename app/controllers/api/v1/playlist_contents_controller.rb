# frozen_string_literal: true

module Api
  module V1
    class PlaylistContentsController < AuthenticationController
      before_action :authenticate_user!
      load_and_authorize_resource

      def index
        render json: ::PlaylistContent.all, status: :ok
      end

      def show
        playlist_content = ::PlaylistContent.find params[:id]
        render json: playlist_content, status: :ok
      end

      def create
        playlist_content = Api::V1::PlaylistContent::CreatePlaylistContentService.new(
          params[:duration],
          params[:priority],
          params[:playlist_id],
          params[:content_id],
          current_user.id
        ).call
        render json: playlist_content, status: :created
      end

      def update
        Api::V1::PlaylistContent::UpdatePlaylistContentService.new(
          params[:id],
          params[:duration],
          params[:priority]
        ).call
        render json: { message: 'PlaylistContent successfully updated' }, status: :ok
      end

      def destroy
        Api::V1::PlaylistContent::DeletePlaylistContentService.new(params[:id]).call
        render json: { message: 'PlaylistContent successfully deleted' }, status: :no_content
      end
    end
  end
end
