class User < ApplicationRecord
# has secure password is used in conjuction with bcrypt, allows the use of password and pw confirmation fields in a sign up form. must add password_digest to the user's table
has_secure_password
has_many :recipes
validates :username, presence: true
validates :username, uniqueness: true 
end
