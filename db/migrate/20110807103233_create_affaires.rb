class CreateAffaires < ActiveRecord::Migration
  def up
    create_table :affaires do |t|
      t.string :reference
      t.decimal :total
      t.string :phase
      t.boolean :etat
      t.datetime :date_debut
      t.integer :duree
      t.boolean :receptioner
      t.string :nom
      
      t.references :phase
      
      t.timestamps
    end
  end
  
  def down
    drop_table :affaires
  end
  
end
