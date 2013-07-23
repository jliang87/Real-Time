class ConvertStringIpsToIntegers < ActiveRecord::Migration

  # def up
  #   change_column :users, :current_sign_in_ip, :integer
  #   change_column :users, :last_sign_in_ip,    :integer
  # end

  # def down
  #   change_column :users, :current_sign_in_ip, :string
  #   change_column :users, :last_sign_in_ip,    :string
  # end

  def up
	  connection.execute(%q{
	    alter table users
	    alter column current_sign_in_ip type integer
      using cast(current_sign_in_ip as integer)
	  })
  end

  def down
	  connection.execute(%q{
	    alter table users
	    alter column current_sign_in_ip type varchar
      using cast(current_sign_in_ip as varchar)
	  })
  end

end

