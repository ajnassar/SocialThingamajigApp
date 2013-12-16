class User < ActiveRecord::Base
   attr_accessible :email, :password
   attr_accessor :password

   before_validation :set_session_token, :set_password_digest, :on => :create
   validates :email, :password_digest, :session_token, :presence => true

   def set_session_token
     self.session_token = SecureRandom::urlsafe_base64(16)
   end

   def set_password_digest
     self.password_digest = BCrypt::Password.create(self.password)
   end

   def reset_session_token!
     set_session_token
     self.save!
   end

   def self.find_by_credentials(email, secret)
     user = User.find_by_email(email)
     return user if !user.nil? && user.is_password?(secret)
     nil
   end

   def is_password?(secret)
     BCrypt::Password.new(self.password_digest).is_password?(secret)
   end
end
