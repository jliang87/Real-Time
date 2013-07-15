class CreateSoftwareTesters < ActiveRecord::Migration
  def change
    create_table :software_testers do |t|

      t.timestamps
    end
  end
end
