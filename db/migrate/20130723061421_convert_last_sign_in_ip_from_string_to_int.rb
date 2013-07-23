class ConvertLastSignInIpFromStringToInt < ActiveRecord::Migration
  def up
    connection.execute(%q{
	    alter table users
	    alter column last_sign_in_ip type integer
      using cast(last_sign_in_ip as integer)
	  })
  end

  def down
    connection.execute(%q{
	    alter table users
	    alter column last_sign_in_ip type varchar
      using cast(last_sign_in_ip as varchar)
	  })
  end
end
