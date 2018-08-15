class User < ApplicationRecord
    has_secure_password

    has_many :items
    has_many :lists, :through => :items
    
    #scope :most_completed_assignments, -> {order (assignments_completed_count: :desc).first}
    #scope :second_most_completed_assignments -> {order(assignments_completed_count: :desc).all[1..-1] }

    validates :email, :presence => true
    validates :email, :uniqueness => true

    def self.find_or_create_by_omniauth(auth_hash)
        #Login with github
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

end
