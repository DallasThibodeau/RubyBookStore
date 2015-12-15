class Author < ActiveRecord::Base
   #<!-- Number of Author objects -->
   @@no_of_authors=0
   
   #<!-- Accessors -->
 #  attr_accessor :author_id, :author_first_name, :author_last_name
 
   before_save { self.last_name = last_name.downcase }

      
   #<!-- Validate the user names -->
   validates :first_name, :allow_blank => true, length: {maximum: 50}
   validates :last_name, presence: true, length: {maximum: 50},
                         uniqueness: { case_sensitive: false }
   
   #<!-- Initializer with required and optional information when creating a new Author -->
#   def initialize(last_name, options = {})
#     @author_first_name[:first_name] || ''
#     @author_last_name = last_name
#   end
end
