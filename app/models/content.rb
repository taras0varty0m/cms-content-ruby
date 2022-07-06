# frozen_string_literal: true

class Content < ApplicationRecord
  belongs_to :user

  validates :file_key, uniqueness: true, presence: true

  validates :user_id, presence: true

  has_many :playlist_contents

  after_destroy :remove_from_storage

  def remove_from_storage
    Contents::RemoveFileService.new(file_key:).call
  end
end
