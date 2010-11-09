# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class User
  include Rhom::PropertyBag
        
  BASE_URL =  "github.com/api/v2/"
  FORMAT = "json"
  
#  attr_accessor  user, pw
  
  def initialize
    # until we have another way to get it. and save it.
#    @user = "dennisfaust"
#    @pw = "S@ndB0x!"
  end
                     
# These all work.
#  https://github.com/api/v2/json/user/show/dennisfaust?login=dennisfaust&token=62448070e1090cdd884b29b90694d225
# curl -v -u "dennisfaust/token:62448070e1090cdd884b29b90694d225" https://github.com/api/v2/json/user/show/dennisfaust
# curl -v -u "dennisfaust:M0b1l35" https://github.com/api/v2/json/user/show/dennisfaust     
# curl -v https://dennisfaust:M0b1l35@github.com/api/v2/json/user/show/dennisfaust 

# curl -v https://github.com/api/v2/json/user/show/dennisfaust?login=dennisfaust&password=M0b1l35

  
  def User.login (user = nil, password = nil, passed_callback = nil)
    return nil if user.nil? || password.nil?
    result = {}

    url = "https://"+user+":"+password+'@'+BASE_URL+FORMAT+"/user/show" 
    url = "https://dennisfaust:M0b1l35@github.com/api/v2/json/user/show/dennisfaust"
puts url                            

# TODO Wrap this with error handling    
    result = Rho::AsyncHttp.get( :url => url, :callback  => passed_callback )     
  end

    
end
