require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper' 
require 'User/user.rb'

class SettingsController < Rho::RhoController
  include BrowserHelper
  
  def index
    @msg = @params['msg']
    @auth_user = @params['auth_user']
    render :back => '/app'
  end
  
  # Display form
  def login
    @msg = @params['msg']
    render :action => :login, :back => '/app/Settings'
  end
  
  # Backend return comes back here
  def login_callback 
    puts "Login Callback @params ="+@params.inspect
    
    if @params['body'] && @params['body']['user'] && @params['body']['user']['plan']
      # login successful
      # TODO: Save user to User Model = @params['body']['user']
      WebView.navigate( url_for :action => :index, :query => {:auth_user => @params['body']['user']['login'] } ) 
    else
      @@auth_user = nil
      @msg = "Login failed."
      WebView.navigate( url_for :action => :login, :query => {:msg => @msg} ) 
    end
    
    # errCode = @params['error_code'].to_i
    # if errCode == 0
    #   # run sync if we were successful
    #   WebView.navigate Rho::RhoConfig.options_path
    #   SyncEngine.dosync
    # else
    #   if errCode == Rho::RhoError::ERR_CUSTOMSYNCSERVER
    #     @msg = @params['error_message']
    #   end
    #     
    #   if !@msg || @msg.length == 0   
    #     @msg = Rho::RhoError.new(errCode).message
    #   end
    #   
    #   WebView.navigate ( url_for :action => :login, :query => {:msg => @msg} )
    # end  
  end               
  
  # Form POST submit comes here
  def do_login
    if @params['user'] and @params['password']
      begin
        User.login(@params['user'], @params['password'], (url_for :action => :login_callback) )
        render :action => :wait
      rescue Rho::RhoError => e
        @msg = e.message
        render :action => :login
      end
    else
      @msg = Rho::RhoError.err_message(Rho::RhoError::ERR_UNATHORIZED) unless @msg && @msg.length > 0
      render :action => :login
    end
  end
  
  def logout
    # SyncEngine.logout
    # TODO: Blank the logged in user and save it.
    @msg = "You have been logged out."
    render :action => :login
  end
  
  def reset
    render :action => :reset
  end
  
  def do_reset
    Rhom::Rhom.database_full_reset
#    SyncEngine.dosync
    @msg = "Database has been reset."
    redirect :action => :index, :query => {:msg => @msg}
  end
  
  def do_sync
#    SyncEngine.dosync
    @msg =  "Sync has been triggered."
    redirect :action => :index, :query => {:msg => @msg}
  end
end
