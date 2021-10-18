class User < ApplicationRecord
# has secure password is enabled by coding bcrypt in the gem file, allows the use of password and pw confirmation fields in a sign up form. must add password_digest to the user's table, and allows the use of the authenticate method.
has_secure_password
has_many :recipes
validates :username, presence: true
validates :username, uniqueness: true 
end
