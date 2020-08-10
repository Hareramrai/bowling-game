class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :player_name
      t.integer :pins_knock_down_in_throws, array: true,  default: []
      t.integer :scores_in_frames, array: true,  default: []
      t.timestamps
    end
  end
end
