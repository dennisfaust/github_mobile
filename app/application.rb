require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    @@tabbar = nil

    super

    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    # SyncEngine::set_objectnotify_url("/app/Settings/sync_notify")
    # SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')
                   
    # GitHub URLs
    $BASE_URL =  "github.com/api/v2/"
    $FORMAT = "json"
    
    # Load the User's saved information
    tmp = User.find(:all)
    $user = nil
    $user = tmp[0].vars if !tmp.nil? && !tmp[0].nil? 
    puts "LOGGED IN USER="+$user.inspect
  end
end
                           

# module Globals
#   MY_CONSTANT=
# end
# 
# reference with Globals::MY_CONSTANT