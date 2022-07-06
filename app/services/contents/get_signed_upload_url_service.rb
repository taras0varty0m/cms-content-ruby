# frozen_string_literal: true

module Contents
  class GetSignedUploadUrlService < ApplicationService
    def initialize(filename)
      @filename = filename
    end

    def call
      storage.object(@filename).presigned_url(:put)
    end
  end
end
