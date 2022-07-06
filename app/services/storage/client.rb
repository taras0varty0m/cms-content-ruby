# frozen_string_literal: true

module Storage
  class Client
    ACCESS_KEY_ID = Rails.application.credentials.dig(:yandex, :access_key_id)
    SECRET_ACCESS_KEY = Rails.application.credentials.dig(:yandex, :secret_access_key)
    REGION = Rails.application.credentials.dig(:yandex, :region)
    ENDPOINT = Rails.application.credentials.dig(:yandex, :endpoint)
    FORCE_PATH_STYLE = true

    def self.instance
      @instance ||= Aws::S3::Client.new(
        access_key_id: ACCESS_KEY_ID,
        secret_access_key: SECRET_ACCESS_KEY,
        region: REGION,
        endpoint: ENDPOINT,
        force_path_style: FORCE_PATH_STYLE
      )
    end
  end
end
