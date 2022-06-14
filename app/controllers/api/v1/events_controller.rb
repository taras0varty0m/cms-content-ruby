# frozen_string_literal: true

module Api
  module V1
    class EventsController < AuthenticationController
      before_action :authenticate_user!, except: %i[index show]

      def index
        render json: ::Event.all, status: :ok
      end

      def show
        event = ::Event.find params[:id]
        render json: event, status: :ok
      end

      def create
        event = Api::V1::Event::CreateEventService.new(params[:title], current_user.id).call
        render json: event, status: :created
      end

      def update
        Api::V1::Event::UpdateEventService.new(params[:id], params[:title]).call
        render json: { message: 'Event successfully updated' }, status: :ok
      end

      def destroy
        Api::V1::Event::DeleteEventService.new(params[:id]).call
        render json: { message: 'Event successfully deleted' }, status: :no_content
      end
    end
  end
end
