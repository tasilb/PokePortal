class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer :level
      t.integer :trainer_id
      t.string :name	
      t.timestamps
    end
  end
end
