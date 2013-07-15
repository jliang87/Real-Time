class CreateSalespeople < ActiveRecord::Migration
  def change
    create_table :salespeople do |t|

      t.timestamps
    end
  end
end
