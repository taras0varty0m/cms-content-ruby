# frozen_string_literal: true

module Storage
  class Resource
    def self.instance
      @instance ||= Aws::S3::Resource.new(client: storage_client)
    end

    private

    def storage_client
      @storage_client ||= Storage::Client.instance
    end
  end
end
