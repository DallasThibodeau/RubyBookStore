class Ad < ActiveRecord::Base
   #<!-- Number of ad objects -->
   @@no_of_ads=0
   belongs_to :user 
   belongs_to :book  
   has_many :comments, dependent: :destroy
   has_many :starrating, dependent: :destroy
      
    #added for paperclip-drop gem   
    #has_attached_file :picture,
    #:storage => :dropbox,s
    #:dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
    #:styles => { :medium => "300x300" , :thumb => "100x100>"},    
    #:dropbox_options => {
    #  :path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"},       
    #  :unique_filename => true   
    #}
    
    def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
      where("title like ?", "%#{query}%") 
    end
    
    has_attached_file :picture,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox_config.yml"),
    :dropbox_options => {:path => proc { |style| "files/#{id}/#{picture.original_filename}" } }

  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
=begin
  has_attached_file :picture#,
                    #:url => "/ads/get/:id", 
                    #:path => ":Rails_root/ads/:id/:basename.:extension"
    
  validates_attachment_content_type :picture, :content_type => /\Aimage/
  #validates_attachment_file_name :picture, :matches => [/png\Z/, /jpe?g\Z/]
=end    
  #do_not_validate_attachment_file_type :picture    
  validates_attachment_size :picture, :less_than => 10.megabytes   
  validates_attachment_presence :picture
  validates :user_id, presence: true
  validates :books_id, presence: true
 
   
    #validates_attachment_size :picture, :less_than => 10.megabytes   
    #validates_attachment_presence :picture
    #validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
   
   #<!-- Validate the ad price -->
   #Allows for optional comma and decimal
   VALID_PRICE_REGEX = /\A(?=.)^\$?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+)?(\.[0-9]{1,2})?$\Z/i
   validates :price, presence: true,
                     format: {with: VALID_PRICE_REGEX}
                     
   #<!-- Validate the ad title -->
   validates :title, presence: true, length: {maximum: 50}#,
                     #uniqueness: { case_sensitive: false }   
                     
                        #<!-- Validate the ad title -->
   validates :description, presence: true, length: {maximum: 255} 
end