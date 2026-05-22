class Blog < ActiveRecord::Base
 
  belongs_to :user
  belongs_to :type_blog_category
  belongs_to :type_blog_tag
  
  mount_uploader :blog_image, BlogimageUploader
  
  validates_presence_of :blog_title, :blog_body, :type_blog_category_id
  
  scope :events_public, -> (parm) {
    joins(:type_blog_category)
      .where("type_blog_categories.type_name = 'Event'")
      .where(:blog_published => true)
      .order(parm || "blog_postdate")
  }

  scope :news_public, -> {
    joins(:type_blog_category)
      .where("type_blog_categories.type_name = 'News'")
      .where(:blog_published => true)
      .order("blog_postdate DESC")
  }

  # Search
  scope :find_slug_public, -> (parm) {
      where("blog_slug like '%#{parm}%' AND blog_published = true")
      .order("blog_postdate DESC") }  
  scope :search_public, -> (parm) {
      where("(UPPER(blog_title) like '%#{parm.upcase}%' OR UPPER(blog_body) like '%#{parm.upcase}%') AND blog_published = true")
      .order("blog_postdate DESC") }

  # Ordered
  scope :ordered, -> (parm) {
      joins(:type_blog_category)
      .order(parm || "blog_postdate DESC") 
  }  
  scope :ordered_public, -> (parm) {
      joins(:type_blog_category)
      .where("type_blog_categories.type_name = 'Blog Post' AND blog_published = true")
      .order(parm || "blog_postdate DESC")
  }
  scope :ordered_securityforce, -> (parm) {
      joins(:type_blog_category)
      .where("type_blog_categories.type_name = 'Security Force Post' AND blog_published = true")
      .order(parm || "blog_postdate DESC")}
  
  
  def self.find_by_tag(tagname)
    returnval = []
    tag_id = TypeBlogTag.find_by_type_name(tagname)
  
    if tag_id
      posts = Blog.ordered_public('blog_postdate DESC')

      posts.each do |post|
        if post.blog_tags        
          tags = post.blog_tags.split(',')    
  
          tags.each do |tag|
            if tag.to_i == tag_id.id.to_i
              returnval << post
            end
          end
        end
      end
    end
    returnval
  end

  def self.find_by_category(catname)
    cat_id = TypeBlogCategory.find_by_type_name(catname)

    if cat_id
      Blog.where(type_blog_category_id: cat_id)
    end
  end
end
