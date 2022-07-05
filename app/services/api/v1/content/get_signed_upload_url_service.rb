# frozen_string_literal: true

module Api
  module V1
    module Content
      class GetSignedUploadUrlService < ApplicationService
        def initialize(filename)
          @filename = filename
        end

        def call
          aws_client = Aws::S3::Client.new(
            access_key_id: Rails.application.credentials.dig(:yandex, :access_key_id),
            secret_access_key: Rails.application.credentials.dig(:yandex, :secret_access_key),
            region: 'ru-central1',
            endpoint: 'https://storage.yandexcloud.net',
            force_path_style: true
          )
          s3 = Aws::S3::Resource.new(client: aws_client)
          bucket = s3.bucket(Rails.application.credentials.dig(:yandex, :bucket))
          bucket.object("#{@filename}-#{SecureRandom.uuid}").presigned_url(:put)
        end
      end
    end
  end
end
