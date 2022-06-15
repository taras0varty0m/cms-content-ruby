# frozen_string_literal: true

module Api
  module V1
    module Content
      class DeleteContentService < ApplicationService
        def initialize(id)
          @id = id
        end

        def call
          @content = ::Content.find @id

          @content.destroy!
        end
      end
    end
  end
end
