# frozen_string_literal: true

class ContentSerializer < ApplicationSerializer
  attributes :id, :file_key, :user_id, :created_at, :updated_at, :href

  def href
    Contents::GetFileHrefService.new(object.file_key).call
  end
end
