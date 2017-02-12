class CreatePlaySessions < ActiveRecord::Migration[5.0]
  def change
    create_table :play_sessions do |t|
      t.integer :game_master
      t.text :players

      t.timestamps
    end
  end
end
