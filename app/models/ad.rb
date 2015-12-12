class Ad < ActiveRecord::Base
   #<!-- Number of ad objects -->
   @@no_of_ads=0
   
   #<!-- Accessors -->
   attr_accessor :ad_id, :ad_book, :ad_price, :ad_tags, :ad_title,
                 :ad_description, :ad_user
                 
   #<!-- Serialize the objects for the database -->
   serialize :ad_user, :book_tags
   
   #<!-- Initializer with required and optional information when creating a new Ad -->
   def initialize(book, price, title, date_posted, user, options = {})
     @ad_book = book
     @ad_price = price
     @ad_title = title
     @ad_user = user
     @ad_tags = options[:tags] || {''}
     @ad_description = options[:description] || ''
   end
end
