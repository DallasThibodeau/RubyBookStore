class Ad < ActiveRecord::Base
   #<!-- Number of ad objects -->
   @@no_of_ads=0
 
   belongs_to :user             
   has_one :book, dependent: :destroy               
   
    has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/    
      
    validates_attachment_size :picture, :less_than => 10.megabytes   
    validates_attachment_presence :picture
    
    #validates :picture, :attachment_presence => true
    validates :user_id, presence: true  
   
    #validates_attachment_size :picture, :less_than => 10.megabytes   
    #validates_attachment_presence :picture
    #validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
    
    #added for paperclip-drop gem   
    #has_attached_file :picture,
    #:storage => :dropbox,
    #:dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
    #:styles => { :medium => "300x300" , :thumb => "100x100>"},    
    #:dropbox_options => {
    #  :path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"},       
    #  :unique_filename => true   
    #}
   
   #<!-- Validate the ad price -->
   #Allows for optional comma and decimal
   VALID_PRICE_REGEX = /\A(?=.)^\$?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+)?(\.[0-9]{1,2})?$\Z/i
   validates :price, presence: true, length: { maximum: 4 },
                     format: {with: VALID_PRICE_REGEX}
                     
   #<!-- Validate the ad title -->
   validates :title, presence: true, length: {maximum: 50},
                     uniqueness: { case_sensitive: true }   
                     
                        #<!-- Validate the ad title -->
   validates :description, presence: true, length: {maximum: 255} 
end
