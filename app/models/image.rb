class Image < ActiveRecord::Base 
    #attr_accessible :picture, :verified, :category, :tags, :user_id  
    
    validates :picture, :attachment_presence => true 
    
    #validates :tags, :presence =>true
    
    #validates :category, :presence => true    
    
    belongs_to :ad
    
    validates_attachment_size :picture, :less_than => 10.megabytes   
    validates_attachment_presence :picture
    
    #added for paperclip-drop gem   
    has_attached_file :picture,
    :storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
    :styles => { :medium => "300x300" , :thumb => "100x100>"},    
    :dropbox_options => {
      :path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"},       
      :unique_filename => true   
    }
end