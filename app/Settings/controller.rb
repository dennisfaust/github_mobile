require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper' 
require 'User/user.rb'

class SettingsController < Rho::RhoController
  include BrowserHelper
  
  def index
    @msg = @params['msg'] 
    render :action => :index, :back => '/app'
  end
  
  def login
    @msg = @params['msg']
    render :action => :login, :back => '/app/Settings'
  end
    
  # Form POST submit comes here
  def do_login
    if @params['user'] and @params['password']
      @@password = @params['password'] 
      @@token = @params['token']
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

  # Backend return comes back here
  def login_callback 
    puts "Login Callback @params ="+@params.inspect    
    if @params['body'] && @params['body']['user'] && @params['body']['user']['plan']
      # login successful
      User.delete_all             
      @params['body']['user']['password'] = @@password             # save the password TODO: Encrypt the PW.
      @params['body']['user']['token'] = @@token                   # save the user's token
      
      @user = User.create(@params['body']['user']) 
      @user = User.find(:all)
      
      # update the global user
      $user = @user[0].vars
      puts "New GLOBAL USER ="+$user.inspect 
      WebView.navigate( url_for :action => :index ) 
    else
      @msg = "Login failed."
      WebView.navigate( url_for :action => :login, :query => {:msg => @msg} ) 
    end
  end               
  
  def logout
    User.delete_all
    $user = nil 
    @msg = "You have been logged out."
    render :action => :login
  end
  
  def reset
    render :action => :reset
  end
  
  def do_reset
    Rhom::Rhom.database_full_reset
    $user = nil 
    @msg = "Database has been reset."
    redirect :action => :index, :query => {:msg => @msg}
  end
  
  def do_sync
    @msg =  "Sync has been triggered."
    redirect :action => :index, :query => {:msg => @msg}
  end
end
