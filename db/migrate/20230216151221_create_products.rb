# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.boolean :published
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
