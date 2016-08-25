class User < ActiveRecord::Base
  has_secure_password

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..20 }
	validates :city, presence: true, length: { in: 2..50 }
	validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: EMAIL_REGEX }
	validates :password, presence: true, length: { in: 7..20 }, on: [:create]

  	has_attached_file :avatar, on: :update
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
