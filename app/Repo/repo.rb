# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Repo
  include Rhom::PropertyBag
  
  
  def Repo.list (user = nil, password = nil, passed_callback = nil)
    return nil if user.nil? || password.nil? || passed_callback.nil?
    result = {}                                                                            
    url = "https://"+user+":"+password+'@'+$BASE_URL+$FORMAT+"/repos/show/"+user 
    puts "Repo.list url ="+url                            

# TODO Wrap this with error handling    
    result = Rho::AsyncHttp.get( :url => url, :callback  => passed_callback )     
  end

end
                  
