require 'rho/rhocontroller'
require 'helpers/browser_helper'

class RepoController < Rho::RhoController
  include BrowserHelper

  #GET /Repo
  def index   
    @repos = Repo.find(:all)
    render :back => '/app'
  end   
  
  def refresh
    if $user.nil? 
      WebView.navigate( url_for :controller => :Settings, :action => :login, :query => {:msg => "Please login first."} )    
    else
      begin
        Repo.list($user[:login], $user[:password], (url_for :action => :refresh_callback) )
        render :action => :wait
      rescue Rho::RhoError => e
        @msg = e.message
        render :action => :index
      end
    end
  end
  
  def refresh_callback
    puts "refresh Callback @params ="+@params.inspect    
    if @params['body'] && @params['body']['repositories'] && @params['body']['repositories'].length > 0         # api call successful
      Repo.delete_all             
      @params['body']['repositories'].each {|r| Repo.create(r) }
      repo_list = Repo.find(:all)
      puts "Refreshed List of REPOs ="+repo_list.inspect 
      WebView.navigate( url_for :action => :index ) 
    else
      WebView.navigate( url_for :action => :login, :query => {:msg => "Refresh Failed"} ) 
    end
  end
  

  # GET /Repo/{1}
  def show
    @repo = Repo.find(@params['id'])
    if @repo
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Repo/new
  def new
    @repo = Repo.new
    render :action => :new
  end

  # GET /Repo/{1}/edit
  def edit
    @repo = Repo.find(@params['id'])
    if @repo
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Repo/create
  def create
    @repo = Repo.create(@params['repo'])
    redirect :action => :index
  end

  # POST /Repo/{1}/update
  def update
    @repo = Repo.find(@params['id'])
    @repo.update_attributes(@params['repo']) if @repo
    redirect :action => :index
  end

  # POST /Repo/{1}/delete
  def delete
    @repo = Repo.find(@params['id'])
    @repo.destroy if @repo
    redirect :action => :index
  end
end
