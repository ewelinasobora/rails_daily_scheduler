# frozen_string_literal: true

class AddLocationToUsers < ActiveRecord::Migration[7.0]
  def up
    change_table :users do |t|
      t.string :location
    end
  end

  def down
    change_table :users do |t|
      t.string :location
    end
  end
end
