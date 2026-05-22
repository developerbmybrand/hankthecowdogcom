module PagesHelper
  
  # Provide content to the content pages
  def content(name)
    
    @content = Content.where('content_title like ?', "%#{name}%")
    
    if (@content.count > 0)
      raw(@content[0].content_text)
    else
      "Content not available."
    end
    
  end

  def define_content_path(result)
    "/" + result.type_content_page.type_location
  end
    
  def define_blog_path(result)
    "/blog/" << result.blog_slug
  end

  def define_book_path(result)
    "/books/" << result.id.to_s
  end

  def define_recipe_path(result)
    "/recipes/" << result.id.to_s
  end
  
  def define_friend_path(result)
    "/friends/" << result.friend_slug
  end
  
  def define_screenplay_path(result)
    "/stageplays/" << result.id.to_s
  end
  
  # General Helpers
  def short_post(text)
    text = strip_tags(text)
    text.split(/\s+/, 51)[0...50].join(' ') << '...'
  end

end
