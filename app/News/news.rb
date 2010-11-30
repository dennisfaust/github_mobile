require 'lib/crack/xml' # for just xml

class News
  include Rhom::PropertyBag

# rhogen model news title,author,media:thumbnail,published,id,content,link,updated
  def News.list (user = nil, token = nil, passed_callback = nil)
    return nil if token.nil? || passed_callback.nil?
    result = {}                                                                            
    url = "https://github.com/"+user+".private.atom?token="+token 
    puts "News.list url ="+url                            

    result = Rho::AsyncHttp.get( :url => url, :callback  => passed_callback )     
  end  
  
  def News.parse (parse_string = nil)
    result = {}
    return nil if parse_string.nil?
    tmp = Crack::XML.parse(parse_string)
    result = tmp['feed']['entry'] 
    # Remove the embedded ':' in the media:thumbnail hash entry
    result.each do |e| 
      if e["media:thumbnail"]
        e["media_thumbnail"] = e["media:thumbnail"]
        e.delete("media:thumbnail")
      end
    end
    puts "News.parse result ="+result.inspect
    result
  end
  
end
