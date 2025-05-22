class CreateGameEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :game_events do |t|
      t.string :event_type, null: false
      t.string :game_name, null: false
      t.datetime :occurred_at, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
