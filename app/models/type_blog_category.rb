class TypeBlogCategory < ActiveRecord::Base
  
  has_many :blogs
  
  validates_presence_of :type_name
  
  scope :ordered, -> (parm) {
    order(parm || 'created_at DESC')
  } 
  
end
