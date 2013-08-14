class User < ActiveRecord::Base
	validates :name, :uniqueness => true

	has_many :userprojects
	has_many :projects, through: :userprojects
end
