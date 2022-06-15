# frozen_string_literal: true

class CreateScreens < ActiveRecord::Migration[6.1]
  def change
    create_table :screens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, index: { unique: true }

      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
