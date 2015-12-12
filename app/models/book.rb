class Book < ActiveRecord::Base
   #<!-- Number of book objects -->
   @@no_of_books=0
   
   #<!-- Accessors -->
   attr_accessor :book_id, :book_title, :book_authors, 
                 :book_user, :book_publishers, :book_num_of_pages, 
                 :book_edition, :book_isHardcover 
   
   #<!-- Serialize the object for the database -->
   serialize :book_user, :book_authors, :book_publishers
   
   #<!-- Initializer with required and optional information when creating a new book -->
   def initialize(title, authors, user, options = {})
     @book_title = title
     @book_authors = authors
     @book_user = user
     @book_publishers = options[:publishers] || null
     @book_num_of_pages = options[:num_of_pages] || 0
     @book_edition = options[:edition] || 0
     @book_isHardcover = options[:isHardcover] || false
   end
end
