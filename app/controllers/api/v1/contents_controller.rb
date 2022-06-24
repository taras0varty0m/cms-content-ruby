# frozen_string_literal: true

module Api
  module V1
    class ContentsController < AuthenticationController
      before_action :authenticate_user!
      load_and_authorize_resource :content, class: ::Content

      def index
        render json: @contents, status: :ok
      end

      def show
        render json: @content, status: :ok
      end

      def create
        content = Api::V1::Content::CreateContentService.new(
          params[:file_key],
          current_user.id
        ).call
        render json: content, status: :created
      end

      def update
        Api::V1::Content::UpdateContentService.new(params[:id], params[:file_key]).call
        render json: { message: 'Content successfully updated' }, status: :ok
      end

      def destroy
        Api::V1::Content::DeleteContentService.new(params[:id]).call
        render json: { message: 'Content successfully deleted' }, status: :no_content
      end
    end
  end
end
