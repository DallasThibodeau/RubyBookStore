class User
   #<!-- Number of User objects -->
   @@no_of_users=0
   
   #<!-- Accessors -->
   attr_accessor :user_id, :user_first_name, :user_last_name, 
                 :user_nickname, :user_email, :user_address, 
                 :user_phone, :user_isAdmin
   
   #<!-- Initializer with required and optional information when creating a new User -->
   def initialize(id, email, options = {})
     @user_id = id
     @user_email = email
     @user_first_name = options[:first_name] || ''
     @user_last_name = options[:last_name] || ''
     @user_nickname = options[:nickname] || ''
     @user_address = options[:address] || ''
     @user_address = options[:phone] || ''
     @user_isAdmin = options[:isAdmin] || false
   end
end