class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :status, :first_name, :last_name

  scope :without_user, lambda {|user| where("id <> :id", :id => user.id) }


  STATUSES = {:in => 0, :out => 1}.freeze

  validates :status, :inclusion => {:in => STATUSES.keys }

  def full_name
    [first_name, last_name].join(" ")
  end

  def status=(val)    
    write_attribute(:status, STATUSES[val.intern])
  end

  def status
    STATUSES.key(read_attribute(:status))
  end

  [:current_sign_in_ip, :last_sign_in_ip].each do |field|
    define_method(field) do
      ip = read_attribute(field)
      return nil unless ip
      ip += 4_294_967_296 if ip < 0 # Convert from 2's complement
      "#{(ip & 0xFF000000) >> 24}.#{(ip & 0x00FF0000) >> 16}.#{(ip & 0x0000FF00) >> 8}.#{ip & 0x000000FF}"
    end

    define_method("#{field}=") do |value|
      quads = value.split('.')      
      if quads.length == 4    
        as_int = (quads[0].to_i * (2**24)) + (quads[1].to_i * (2**16)) + (quads[2].to_i * (2**8)) + quads[3].to_i
        as_int -= 4_294_967_296 if as_int > 2147483647 # Convert to 2's complement
      else
        as_int = nil
      end
      write_attribute(field, as_int)      
    end

  end


end
