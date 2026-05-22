module GamesHelper
  
  def games_supported_browser
    useragent = request.env['HTTP_USER_AGENT'].downcase

    if useragent.index('msie') || useragent.index('opera')
      false
    else
      true
    end
  end
  
end
