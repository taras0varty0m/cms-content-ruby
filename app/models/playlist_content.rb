# frozen_string_literal: true

class PlaylistContent < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  belongs_to :content

  validates :duration, uniqueness: true, presence: true
  validates :priority, uniqueness: true, presence: true

  validates :user_id, presence: true
  validates :playlist_id, presence: true
  validates :content_id, presence: true
end
