class TypeContentPage < ActiveRecord::Base
  
  has_many :contents
  
  scope :ordered, -> (type) { order(type || 'created_at DESC') }
end
