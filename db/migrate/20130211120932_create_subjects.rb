class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :id
      t.string :sname

      t.timestamps
    end
  end
end
