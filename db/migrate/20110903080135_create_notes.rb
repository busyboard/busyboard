class CreateNotes < ActiveRecord::Migration
  def up
    create_table :notes do |t|
      t.text :note

      t.references :affaire

      t.timestamps
    end
  end
  
  def down
    drop_table :notes
  end
end
