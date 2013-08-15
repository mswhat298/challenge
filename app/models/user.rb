class User < ActiveRecord::Base
	validates :name, :uniqueness => true

	has_many :userprojects
	has_many :projects, through: :userprojects

	def self.authenticate(frmuser, frmpassword)
		name = self.find_by_name(frmuser)
		if (name)
			if name.password != frmpassword
				name = nil
			end
		end
		name
	end

end
