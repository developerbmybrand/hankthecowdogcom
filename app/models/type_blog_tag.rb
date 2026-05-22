class TypeBlogTag < ActiveRecord::Base
  
  has_many :blogs
  
  validates_presence_of :type_name
  
  scope :ordered, -> (parm) { order(parm || 'created_at DESC')}
  
  scope :search_tag_name, -> (parm) {
    where("(UPPER(type_name) like '%#{parm.upcase}%')") 
  }

end
