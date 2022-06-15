# frozen_string_literal: true

class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.references :user, null: false, foreign_key: true
      t.string :fileKey, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
