class Comment < ActiveRecord::Base
  #attr_accessible :body, :ad_id
  belongs_to :ad
end
