# frozen_string_literal: true

class CreatePlaylistContents < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_contents do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :content, null: false, foreign_key: true
      t.belongs_to :playlist, null: false, foreign_key: true

      t.numeric :duration, null: false, index: { unique: true }
      t.numeric :priority, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
