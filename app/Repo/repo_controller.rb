require 'rho/rhocontroller'
require 'helpers/browser_helper'

class RepoController < Rho::RhoController
  include BrowserHelper

  #GET /Repo
  def index
    @repos = Repo.find(:all)
    render
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
