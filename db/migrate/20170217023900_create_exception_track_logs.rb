# frozen_string_literal: true

class CreateExceptionTrackLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :exception_tracks do |t|
      t.string :title
      t.text :body, limit: 16_777_215

      t.timestamps
    end
  end
end
