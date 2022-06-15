# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  validates :title, uniqueness: true, presence: true

  has_many :screens
end
