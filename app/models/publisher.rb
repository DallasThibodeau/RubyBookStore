class Publisher < ActiveRecord::Base
   #<!-- Number of Publisher objects -->
   @@no_of_publisher=0
   
   #<!-- Accessors -->
   attr_accessor :publisher_name
   
   #<!-- Initializer with required and optional information when creating a new Publisher -->
   def initialize(name)
     @publisher_name = name
   end
end
