class Community < ApplicationRecord
    has_many :users through: :identity
    has_one :identity 

end
