xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Hank the Cowdog"
    xml.description "Blog Posts"
    xml.link 'https://www.hankthecowdog.com/blog'

    for post in @posts
      xml.item do
        xml.title post.blog_title
        xml.description post.blog_body
        xml.pubDate post.blog_postdate.to_s(:rfc822)
        xml.link full_post_link_path(post)
        xml.guid full_post_link_path(post)
      end
    end
  end
end