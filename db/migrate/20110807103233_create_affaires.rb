class CreateAffaires < ActiveRecord::Migration
  def change
    create_table :affaires do |t|
      t.string :reference
      t.decimal :total
      t.string :phase
      t.string :etat
      t.datetime :date_debut
      t.integer :duree
      t.boolean :receptioner
      t.string :nom

      t.timestamps
    end
  end
end
