class AddPhIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :ph_id, :integer
  end
end
