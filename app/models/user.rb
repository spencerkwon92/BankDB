class User < ApplicationRecord
    has_secure_password
    has_many :preferences
    
    # set the limitation.
    validates :name, presence: true
    validates :email, format: { with: /@/, message: "must have an @" }, uniqueness: true
    
    def self.new_from_hash(user_hash)
        user = User.new user_hash
        user.password_digest = 0
        user
    end
    
    def has_password?
        self.password_digest.nil? || self.password_digest != '0'
    end
    
    def is_admin?
        self.role
    end    
    
end
