class Spec < ActiveRecord::Base
	belongs_to :user
	belongs_to :firm
	has_many :calcs
end

class Calc < ActiveRecord::Base
	belongs_to :spec
  has_attached_file :file  
end
