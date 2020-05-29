class Identity < ApplicationRecord
    has_many :users 
    has_one :community 

   
end
