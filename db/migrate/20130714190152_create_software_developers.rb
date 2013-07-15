class CreateSoftwareDevelopers < ActiveRecord::Migration
  def change
    create_table :software_developers do |t|

      t.timestamps
    end
  end
end
