class User < ApplicationRecord
    has_secure_password

    validates :email, :presence => true
    validates :email, :uniqueness => true

    def self.find_or_create_by_omniauth(auth_hash)
        #Login with github
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

end
