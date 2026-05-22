module ContactsHelper
  
  def content(name)
    Content.where('content_title like ?', "%#{name}%")[0].content_text    
  end
  
end
