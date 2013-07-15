class AddBelongsToTeammableToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.belongs_to :teammable, polymorphic: true
  	end
  	add_index :users, [:teammable_id, :teammable_type]
  end
end
