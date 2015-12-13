class Ad < ActiveRecord::Base
   #<!-- Number of ad objects -->
   @@no_of_ads=0
   
   #<!-- Accessors -->
 #  attr_accessor :ad_id, :ad_book, :ad_price, :ad_tags, :ad_title,
 #                :ad_description, :ad_user
                 
   #<!-- Serialize the objects for the database -->
   serialize :user, :tags
   
   #<!-- Validate the ad book -->
   validates :book, presence: true
   
   #<!-- Validate the ad price -->
   #Allows for optional comma and decimal
   VALID_PRICE_REGEX = /(?=.)^\$?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+)?(\.[0-9]{1,2})?$/i
   validates :price, presence: true, length: { maximum: 4 },
                     format: {with: VALID_PRICE_REGEX}
                     
   #<!-- Validate the ad title -->
   validates :title, presence: true, length: {maximum: 50},
                     uniqueness: { case_sensitive: true }   
   
   #<!-- Validate the ad user -->
   validates :user, presence: true
   
  attr_accessible :picture, :verified, :category, :tags, :user_id  
  #added for paperclip-drop gem   
  has_attached_file :picture,
  :storage => :dropbox,
  :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
  :styles => { :medium => "300x300" , :thumb => "100x100>"},    
  :dropbox_options => {
    :path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"},       
    :unique_filename => true   
  }
   
   #<!-- Initializer with required and optional information when creating a new Ad -->
#   def initialize(book, price, title, date_posted, user, options = {})
#     @ad_book = book
#     @ad_price = price
#     @ad_title = title
#     @ad_user = user
#     @ad_tags = options[:tags] || ''
#     @ad_description = options[:description] || ''
#   end
end
