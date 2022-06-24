# frozen_string_literal: true

module Api
  module V1
    class ScreensController < AuthenticationController
      before_action :authenticate_user!
      load_and_authorize_resource :screen, class: ::Screen

      def index
        render json: @screens, status: :ok
      end

      def show
        render json: @screen, status: :ok
      end

      def create
        screen = Api::V1::Screen::CreateScreenService.new(
          params[:name],
          params[:event_id],
          current_user.id
        ).call
        render json: screen, status: :created
      end

      def update
        Api::V1::Screen::UpdateScreenService.new(params[:id], params[:name]).call
        render json: { message: 'Screen successfully updated' }, status: :ok
      end

      def destroy
        Api::V1::Screen::DeleteScreenService.new(params[:id]).call
        render json: { message: 'Screen successfully deleted' }, status: :no_content
      end
    end
  end
end
