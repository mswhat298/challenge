class User < ActiveRecord::Base
	has_many :userprojects
	has_many :projects, through: :userprojects
end
