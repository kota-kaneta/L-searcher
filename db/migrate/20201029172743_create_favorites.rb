class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :maked, foreign_key: { to_table: :users }
      t.references :making, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :favorites, [:maked_id, :making_id], unique: true
  end
end
