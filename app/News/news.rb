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
    # tmp = Crack::XML.parse(parse_string) 
    
    require 'lib/xmlsimple'    
    tmp = XmlSimple.xml_in(parse_string, {'ForceArray' => false})
    result = tmp['entry']                       
  
    # flatten the included hashes for author and thumbnail
    # because rhodes turns them into strings :-(
    result.each do |r|
      r['thumbnail'].map.each {|t| r['thumbnail_'+t[0]] = t[1] } if r['thumbnail']
      r['author'].map.each {|t| r['author_'+t[0]] = t[1] }  if r['author']
      r['content'] = nil if r['content']
    end
  
    puts "News.parse result[0] ="+result[0].inspect
    result
  end
  
end
