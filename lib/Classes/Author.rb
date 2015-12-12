class Author
   #<!-- Number of Author objects -->
   @@no_of_authors=0
   
   #<!-- Accessors -->
   attr_accessor :author_id, :author_first_name, :author_last_name
   
   #<!-- Initializer with required and optional information when creating a new Author -->
   def initialize(id, last_name, options = {})
     @author_id = id
     @author_first_name[:first_name] || ''
     @author_last_name = last_name
   end
end