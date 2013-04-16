class AddStatusAndNamesToUsers < ActiveRecord::Migration

  def change
    change_table :users do |t|
      t.integer :status,    :default => 0,  :null => false
      t.string :first_name, :length => 255, :null => false
      t.string :last_name,  :length => 255, :null => false
    end
  end
end
