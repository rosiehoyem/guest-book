class User < ActiveRecord::Base
	has_many :messages
	validates :name, :location, presence: true
end
