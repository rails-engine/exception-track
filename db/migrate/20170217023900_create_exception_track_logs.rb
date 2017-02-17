class CreateExceptionTrackLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :exception_tracks do |t|
      t.string :title
      t.longtext :body

      t.timestamps
    end
  end
end
