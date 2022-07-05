# frozen_string_literal: true

module Api
  module V1
    module Content
      class GetFileHrefService < ApplicationService
        def initialize(file_key)
          @file_key = file_key
        end

        def call
          "https://storage.yandexcloud.net/#{
            Rails.application.credentials.dig(:yandex, :bucket)
          }/#{file_key}"
        end
      end
    end
  end
end
