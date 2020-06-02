module UsersHelper
    def save_id_name 
        user.identities.each do |i|
            i.name = i.community.name 
        end
    end
end
