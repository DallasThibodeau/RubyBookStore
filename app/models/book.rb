class Book < ActiveRecord::Base
   #<!-- Number of book objects -->
   @@no_of_books=0
   has_many :ad, dependent: :destroy
   #<!-- Validate the book title -->
   validates :title, presence: true, length: {maximum: 255},
                     uniqueness: { case_sensitive: false }
   
   validates :num_of_pages, presence: true
   #validates :isHardcover, presence: true
   validates :edition, presence: true
end
