# frozen_string_literal: true

class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :screen, null: false, foreign_key: true
      t.string :title, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
