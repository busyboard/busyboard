class CreatePhases < ActiveRecord::Migration
  def up
    create_table :phases do |t|
      t.string :name

      t.timestamps
    end
  end
  
  def down
    drop_table :phases
  end
end
