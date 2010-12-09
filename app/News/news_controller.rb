require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper' 
require 'News/news.rb'

class NewsController < Rho::RhoController
  include BrowserHelper

  #GET /News
  def index
    @msg = @params['msg']
    @news = []
    begin
      @news = News.find(:all) 
    rescue Rho::RhoError => e
      @msg = e.message
    end
     
    puts "List of NEWS ="+@news.inspect  
    render
  end

  def refresh
    if $user.nil? 
      WebView.navigate( url_for :controller => :Settings, :action => :login, :query => {:msg => "Please login first."} )    
    else
      begin
        News.list($user[:login], $user[:token], (url_for :action => :refresh_news_callback) )
        render :action => :wait
      rescue Rho::RhoError => e
        @msg = e.message
        render :action => :index
      end
    end
  end
  
  def refresh_news_callback 
    #puts "** IN REFRESH CALLBACK ** @params="+@params.inspect
    
    result = News.parse(@params['body'])
        
    if result && result.length > 0         # api call successful
      News.delete_all             
      result.each {|r| News.create(r) }
      news_list = News.find(:all)
      puts "Refreshed List of NEWS ="+news_list.inspect 
      WebView.navigate( url_for :action => :index ) 
    else
      WebView.navigate( url_for :action => :index, :query => {:msg => "No new News items found."} )
    end
  end


  # GET /News/{1}
  def show
    @news = News.find(@params['id'])
    if @news
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /News/new
  def new
    @news = News.new
    render :action => :new
  end

  # GET /News/{1}/edit
  def edit
    @news = News.find(@params['id'])
    if @news
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /News/create
  def create
    @news = News.create(@params['news'])
    redirect :action => :index
  end

  # POST /News/{1}/update
  def update
    @news = News.find(@params['id'])
    @news.update_attributes(@params['news']) if @news
    redirect :action => :index
  end

  # POST /News/{1}/delete
  def delete
    @news = News.find(@params['id'])
    @news.destroy if @news
    redirect :action => :index
  end
end
