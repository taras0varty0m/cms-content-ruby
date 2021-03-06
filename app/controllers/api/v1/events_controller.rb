# frozen_string_literal: true

module Api
  module V1
    class EventsController < AuthenticationController
      before_action :authenticate_user!
      load_and_authorize_resource :event, class: ::Event

      def index
        render json: @events, status: :ok
      end

      def show
        render json: @event, status: :ok
      end

      def create
        event = Events::CreateEventService.new(params[:title], current_user.id).call
        render json: event, status: :created
      end

      def update
        Events::UpdateEventService.new(params[:id], params[:title]).call
        render json: { message: 'Event successfully updated' }, status: :ok
      end

      def destroy
        Events::DeleteEventService.new(params[:id]).call
        render json: { message: 'Event successfully deleted' }, status: :no_content
      end
    end
  end
end
