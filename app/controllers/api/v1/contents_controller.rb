# frozen_string_literal: true

module Api
  module V1
    class ContentsController < AuthenticationController
      before_action :authenticate_user!
      load_and_authorize_resource :content, class: ::Content

      def index
        render json: @contents, each_serializer: ContentSerializer, status: :ok
      end

      def show
        render json: @content, serializer: ContentSerializer, status: :ok
      end

      def create
        content = Contents::CreateContentService.new(params[:file_key], current_user.id).call
        render json: content, serializer: ContentSerializer, status: :created
      end

      def update
        Contents::UpdateContentService.new(params[:id], params[:file_key]).call
        render json: { message: 'Content successfully updated' }, status: :ok
      end

      def destroy
        Contents::DeleteContentService.new(params[:id]).call
        render json: { message: 'Content successfully deleted' }, status: :no_content
      end

      def upload_s3_file_link
        url = Contents::GetSignedUploadUrlService.new(params[:filename]).call
        render json: { url: }, status: :ok
      end
    end
  end
end
