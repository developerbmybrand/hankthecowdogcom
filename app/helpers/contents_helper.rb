module ContentsHelper
  
  def insert_content(name)
    @content = Content.search_public(name)
    @content.count > 0 ? raw(@content[0].content_text) : ''
  end

  def insert_content_image(name)
    @content = Content.search_public(name).first
    @content.content_image.nil? ? 'nil' : raw("<img src=\"#{@content.content_image}\" alt=\"Image\" />") if @content
  end
end
