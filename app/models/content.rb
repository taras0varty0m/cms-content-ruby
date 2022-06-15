# frozen_string_literal: true

class Content < ApplicationRecord
  belongs_to :user

  validates :fileKey, uniqueness: true, presence: true

  validates :user_id, presence: true

  has_many :playlist_contents
end
