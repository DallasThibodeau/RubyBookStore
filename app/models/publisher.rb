class Publisher < ActiveRecord::Base
   #<!-- Number of Publisher objects -->
   @@no_of_publisher=0
   
   #<!-- Accessors -->
#   attr_accessor :publisher_name
      
   belongs_to :book
  
   before_save { self.name = name.downcase }

   #<!-- Validate the publisher name -->
   validates :name, presence: true, length: {maximum: 255},
                    uniqueness: { case_sensitive: false }
   
   #<!-- Initializer with required and optional information when creating a new Publisher -->
 #  def initialize(name)
 #    @publisher_name = name
 #  end
end
