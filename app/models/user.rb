class User < ActiveRecord::Base
   attr_accessible :email, :password
   attr_accessor :password

   before_validation :set_session_token, :set_password_reset_token,
                     :set_password_digest, :on => :create

   validates :email, :password_digest, :session_token, :presence => true

   has_many :friend_circles
   has_many :friend_circle_memberships, foreign_key: :member_id
   has_many :friends, through: :friend_circle, source: :friends


   def set_password_reset_token
     self.password_reset_token = SecureRandom::urlsafe_base64(16)
   end

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

   def reset_password!(new_password)
     set_password_reset_token
     self.password = new_password
     set_password_digest
     save!
   end

   def self.find_by_credentials(params = {:email => nil, :password => nil})
     user = User.find_by_email(params[:email])
     return user if !user.nil? && user.is_password?(params[:password])
     nil
   end

   def is_password?(secret)
     BCrypt::Password.new(self.password_digest).is_password?(secret)
   end
end
