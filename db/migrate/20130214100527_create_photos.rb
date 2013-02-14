class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :id
      t.string :name
      t.integer :usr_id

      t.timestamps
    end
  end
end
