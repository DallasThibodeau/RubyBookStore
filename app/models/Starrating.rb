class Starrating < ActiveRecord::Base
   belongs_to :user, dependent: :destroy 
   belongs_to :ad, dependent: :destroy 
  
   validates :ownerID, presence: true,  uniqueness: { scope: [:ownerID, :raterID, :ad_id] }
   validates :raterID, presence: true,  uniqueness: { scope: [:ownerID, :raterID, :ad_id] }
   validates :ad_id, presence: true,  uniqueness: { scope: [:ownerID, :raterID, :ad_id] }
   validates :rating, presence: true
end