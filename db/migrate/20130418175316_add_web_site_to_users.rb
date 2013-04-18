class AddWebSiteToUsers < ActiveRecord::Migration

  def change
    change_table :users do |t|
      t.string :web_site, :length => 255
    end
  end
end
