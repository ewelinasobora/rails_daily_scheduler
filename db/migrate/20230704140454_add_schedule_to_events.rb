# frozen_string_literal: true

class AddScheduleToEvents < ActiveRecord::Migration[7.0]
  def change
    change_table :events, bulk: true do |t|
      t.boolean :schedule, default: false
      t.boolean :published, default: false
      t.datetime :publish_at
    end
  end
end
