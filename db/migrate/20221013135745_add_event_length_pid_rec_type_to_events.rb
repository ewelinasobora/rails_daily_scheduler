# frozen_string_literal: true

class AddEventLengthPidRecTypeToEvents < ActiveRecord::Migration[7.0]
  def change
    change_table :events, bulk: true do |t|
      t.string :rec_type, null: false, default: ''
      t.integer :event_length
      t.integer :event_pid
    end
  end
end
