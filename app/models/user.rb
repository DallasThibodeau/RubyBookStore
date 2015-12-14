class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   #<!-- Number of User objects -->
   @@no_of_users=0
   
   has_many :ad, dependent: :destroy 
   
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
   
   #<!-- Validate the user names -->
   validates :first_name, :allow_blank => true, length: {maximum: 50}
   validates :last_name, :allow_blank => true, length: {maximum: 50}
   validates :nickname, :allow_blank => true, length: {maximum: 50}
   
   #<!-- Validates the user phone number -->
   VALID_PHONENUMBER_REGEX = /\A(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?\z/i
   validates :phone, :allow_blank => true, length: { maximum: 20 },
                     format: {with: VALID_PHONENUMBER_REGEX}
   
   #<!-- Validates the user address -->
   #VALID_ADDRESS_REGEX = /\d{1,5}\s\w.\s(\b\w*\b\s){1,2}\w*\./i
   validates :address, :allow_blank => true, length: { maximum: 50 }#,
                       #format: {with: VALID_ADDRESS_REGEX} 
                       
   #<!-- Validate password -->    
   validates :password, presence: true, length: { minimum: 6 }
   
   def feed
    Ad.where("user_id = ?", id)
   end
   
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
