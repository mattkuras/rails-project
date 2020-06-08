class User < ApplicationRecord
 

    has_secure_password
    has_many :posts 
    has_many :comments
    has_many :identities

    has_many :communities, through: :identities 
    accepts_nested_attributes_for :identities, reject_if: proc { |attributes| attributes ['standard'].blank?}
    accepts_nested_attributes_for :communities

    has_many :likes


  

    validates :first_name, presence: true, length: { minimum: 2 }
    validates :last_name, presence: true, length: { minimum: 2 }
    validates :password, length: { in: 6..20 }
    validates :email, presence: true, uniqueness: true#, message: "that email has already been used"

    def name 
        self.first_name + " " + self.last_name
    end

    def self.create_with_omniauth(auth)
  
        user = find_or_create_by(uid: auth['uid'], provider:  auth['provider'])

        user.email = "#{auth['uid']}@#{auth['provider']}.com"
        user.password = auth['uid']
        user.first_name = auth['info']['first_name']
        user.last_name = auth['info']['last_name']

        if User.exists?(user.id)
          user
        else
          user.save!
          user
        end
      end
    
end
