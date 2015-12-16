class Starrating < ActiveRecord::Base
   belongs_to :user, dependent: :destroy 
   belongs_to :ad, dependent: :destroy 
  
   validates :ownerID, presence: true
   validates :raterID, presence: true
   validates :ad_id, presence: true
   validates :rating, presence: true
end