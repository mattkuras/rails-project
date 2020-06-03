class Community < ApplicationRecord
    has_many :users, through: :identities
    has_many :identities 
    has_many :posts

end
