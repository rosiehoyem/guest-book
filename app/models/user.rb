class User < ActiveRecord::Base
	has_many :messages, :dependent => :destroy
	accepts_nested_attributes_for :messages
	validates :name, :location, presence: true
	validates_uniqueness_of :email
	has_secure_password

end
