describe "User" do
  before(:all) do
    @real_hash = {"plan"=>{"name"=>"small", "collaborators"=>5, "space"=>1228800, "private_repos"=>10}, "gravatar_id"=>"ddb0ad076598c1c6e97c88fbeabe39b7", "name"=>"Test User", "company"=>"", "location"=>"SF Bay Area", "created_at"=>"2008/12/19 15:57:19 -0800", "disk_usage"=>3416, "collaborators"=>4, "public_repo_count"=>0, "public_gist_count"=>0, "blog"=>nil, "following_count"=>0, "id"=>9999, "owned_private_repo_count"=>4, "private_gist_count"=>1, "type"=>"User", "total_private_repo_count"=>4, "followers_count"=>0, "login"=>"dennisfaust", "email"=>"dennis@dennisfaust.com"}
  end
  
  before(:each) do
    puts "Before test User list ="+User.find(:all).inspect
  end 
  
  after(:each) do
    puts "After test User list ="+User.find(:all).inspect
  end

  it "delete any test records" do
    conditions = {'id'=> @real_hash['id']}
    User.delete_all(:conditions => conditions)
    User.find(:all, :conditions => conditions ).length.should == 0    
  end                         

      
  it "should add a record from a test hash" do 
    conditions = {'id'=> @real_hash['id']}
    user = User.find(:all, :conditions => conditions)
    user.length.should == 0
                 
    user = User.create(@real_hash)

    user = User.find(:all, :conditions => conditions)
    user.length.should == 1
    user[0].vars[:name].should == @real_hash['name']
  end
                       
  it "should find and delete the test record" do
    conditions = {'id'=> @real_hash['id']}
    User.delete_all(:conditions => conditions)
    User.find(:all, :conditions => conditions ).length.should == 0    
  end                         
   
end