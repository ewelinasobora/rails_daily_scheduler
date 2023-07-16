# frozen_string_literal: true

class AddDisableToEvents < ActiveRecord::Migration[7.0]
  def up
    change_table :events do |t|
      t.boolean :disable
    end
  end

  def down
    change_table :events do |t|
      t.boolean :disable
    end
  end
end
