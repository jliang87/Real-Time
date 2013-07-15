class CreateAccountants < ActiveRecord::Migration
  def change
    create_table :accountants do |t|

      t.timestamps
    end
  end
end
