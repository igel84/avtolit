class User < ActiveRecord::Base
  attr_accessible :name, :pass
  
  attr_accessor :pass
	before_save :save_password
  
  validates_confirmation_of :pass
  validates_presence_of :pass, :on => :create
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.authenticate(name, pass)
    user = find_by_name(name)
    if user && user.password == pass
      user
    else
      nil
    end
  end
  
  def save_password
	  if pass.present?
	  	self.password = pass
	  end
	end

	def can?(method)
		if self == nil
			false
		else
			if (self.role? :super_admin)
		  	true
			else
				if method == nil 
					false
				else
					case method
						
						when String
							case method
								when 'spec'
									if (self.role? :manager or self.role? :director)
										true
									else
										false
									end
								when 'user'
									false if !self.role? :super_admin
								end														
						when  Spec
							return true if self.role? :director
							method.user == self ? true : false
						end
				end
			end
		end
  end
  
	def role?(role)
		  return !!self.roles.find_by_name(role.to_s)
	end

	has_many :user_roles
	has_many :roles, :through => :user_roles
	has_many :user_specs
	has_many :spec, :through => :user_specs  
end

class UserRole < ActiveRecord::Base
	belongs_to :user
	belongs_to :role
end

class UserSpec < ActiveRecord::Base
end
