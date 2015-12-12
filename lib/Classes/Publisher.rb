class Publisher
   #<!-- Number of Publisher objects -->
   @@no_of_publisher=0
   
   #<!-- Accessors -->
   attr_accessor :publisher_id, :publisher_name
   
   #<!-- Initializer with required and optional information when creating a new Publisher -->
   def initialize(id, name)
     @publisher_id = id
     @publisher_name = name
   end
end