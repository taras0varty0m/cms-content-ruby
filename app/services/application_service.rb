# frozen_string_literal: true

class ApplicationService
  BUCKET = Rails.application.credentials.dig(:yandex, :bucket)

  def self.call(*args, &)
    new(*args, &).call
  end

  private

  def storage
    @storage ||= Storage::Resource.instance.bucket(BUCKET)
  end
end
