# frozen_string_literal: true

class Playlist < ApplicationRecord
  belongs_to :user
  belongs_to :screen

  validates :title, uniqueness: true, presence: true

  validates :user_id, presence: true
  validates :screen_id, presence: true

  has_many :playlist_contents
end
