class Book < ActiveRecord::Base
   #<!-- Number of book objects -->
   @@no_of_books=0
   has_many :ad, dependent: :destroy
   #<!-- Validate the book title -->
   validates :title, presence: true, length: {maximum: 50},
                     uniqueness: { case_sensitive: false }
   

   VALID_PRICE_REGEX = /\A(?=.)^\$?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+)?(\.[0-9]{1,2})?$\Z/i
   validates :num_of_pages, presence: true,
                     format: {with: VALID_PRICE_REGEX}
   validates :isHardcover, presence: true
   validates :edition, presence: true, length: {maximum: 255} 
end
