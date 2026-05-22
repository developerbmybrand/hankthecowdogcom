module BlogHelper
  
  def post_link_path(post)
    "/blog/" + post.blog_slug
  end
  
  def full_post_link_path(post)
    "https://www.hankthecowdog.com/blog/" + post.blog_slug
  end

  def post_body(post)
    raw(truncate(post.blog_body, :length => 304).gsub(/&nbsp;/i,""))
  end

  def tag_is_being_used?(blog, tag)
    found = false
        
    if !blog.blog_tags.nil?
      tags = blog.blog_tags.split(',') 

      tags.each do |scantag|
        found = true if scantag.to_i == tag.id.to_i
      end
    end
    found
  end
  
  def get_tag_names(tags)
    returnval = ''
    
    if !tags.nil?
      tagsa = tags.split(',')
      
      tagsa.each do |tag|
        tag_name = TypeBlogTag.find_by_id(tag.to_i).type_name
        if tag_name
          returnval << tag_name << ", "
        end
      end
    end
    returnval[0, returnval.length - 2]
  end
end
