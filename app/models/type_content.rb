class TypeContent < ActiveRecord::Base
  
  has_many :contents
  
  scope :ordered, -> (parm) { 
    order(parm || 'created_at DESC')
  }
end
