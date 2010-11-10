# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class User
  include Rhom::PropertyBag
        
  BASE_URL =  "github.com/api/v2/"
  FORMAT = "json"

  attr_accessor :login, 
                :email, 
                :name,
                :company,
                :location,
                :id
  
  def User.login (user = nil, password = nil, passed_callback = nil)
    return nil if user.nil? || password.nil? || passed_callback.nil?
    result = {}                                                                            
    url = "https://"+user+":"+password+'@'+BASE_URL+FORMAT+"/user/show/"+user 
    puts "User.login url ="+url                            

# TODO Wrap this with error handling    
    result = Rho::AsyncHttp.get( :url => url, :callback  => passed_callback )     
  end

    
end
