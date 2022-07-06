# frozen_string_literal: true

class Screen < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_one :playlist

  validates :user_id, presence: true
  validates :event_id, presence: true
end
