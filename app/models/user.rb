class User < ActiveRecord::Base
   #<!-- Number of User objects -->
   @@no_of_users=0
   
   #<!-- Accessors -->
#   attr_accessor :user_id, :user_first_name, :user_last_name, 
#                 :user_nickname, :user_email, :user_address, 
#                 :user_phone, :user_isAdmin
   
   #<!-- Change email to lower case before it enters the db -->
   before_save { self.email = email.downcase }
 
   #<!-- Validates the email -->
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
   
   #<!-- Initializer with required and optional information when creating a new User -->
 #  def initialize(email, options = {})
 #    @user_email = email
 #    @user_first_name = options[:first_name] || ''
 #    @user_last_name = options[:last_name] || ''
 #    @user_nickname = options[:nickname] || ''
 #    @user_address = options[:address] || ''
 #    @user_address = options[:phone] || ''
 #    @user_isAdmin = options[:isAdmin] || false
 #  end
end
