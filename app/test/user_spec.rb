describe "User" do
  before(:all) do
    @simple_test_hash = {"name"=>"Dennis Faust", "company"=>"", "location"=>"SF Bay Area", "id"=>41698,"login"=>"dennisfaust", "email"=>"dennis@dennisfaust.com"}
    @real_hash = {"plan"=>{"name"=>"small", "collaborators"=>5, "space"=>1228800, "private_repos"=>10}, "gravatar_id"=>"ddb0ad076598c1c6e97c88fbeabe39b7", "name"=>"Dennis Faust", "company"=>"", "location"=>"SF Bay Area", "created_at"=>"2008/12/19 15:57:19 -0800", "disk_usage"=>3416, "collaborators"=>4, "public_repo_count"=>0, "public_gist_count"=>0, "blog"=>nil, "following_count"=>0, "id"=>41698, "owned_private_repo_count"=>4, "private_gist_count"=>1, "type"=>"User", "total_private_repo_count"=>4, "followers_count"=>0, "login"=>"dennisfaust", "email"=>"dennis@dennisfaust.com"}
    @save_user_data = User.find(:all).first
  end
  
  before(:each) do
    puts "Before test User list ="+User.find(:all).inspect
  end 
  
  after(:each) do
    puts "After test User list ="+User.find(:all).inspect
  end
      

  # it "should delete all existing user records in the DB" do
  #    User.delete_all
  #    User.find(:all).length.should == 0
  # end
  #  
   
  it "should add a record from a simple test hash" do     
     user = User.create(@simple_test_hash)
     user = User.find(:all)
     user.length.should == 1
     # puts "user ="+user.inspect
     # puts "user[0] ="+user[0].inspect
     # puts "user[0].vars ="+user[0].vars.inspect 
     # #@user[0].instance_variable_get(:@vars)[:email] 
     # puts "user[0].vars[:name] ="+user[0].vars[:name]                                          
     user[0].vars[:name].should == @simple_test_hash['name']
  end
                       
  it "should find and delete the simple test record" do
    conditions = {'id'=> @simple_test_hash['id']}
    User.find(:all, conditions ).length.should == 1
    User.delete_all(:conditions => conditions)
    User.find(:all, conditions ).length.should == 0    
  end                         
  
  # it "should create a record from a real returned hash" do
  #   user = User.create(@real_hash)
  #   user = User.find(:all)        
  #   puts "real hash user ="+user.inspect
  #   user.length.should == 1
  #   user[0].vars[:name].should == @real_hash['name']
  # end 
    
     
  it "should delete the sample record" do 
    conditions = {'id'=> @real_hash['id']}
    User.find(:all, conditions ).length.should == 1
    User.delete_all(:conditions => conditions)
    User.find(:all, conditions ).length.should == 0
  end
    
  it "should return the user data for a known good user/pw combination"
  
  # after(:all) do
  #   User.delete_all 
  #   User.create(@save_user_data)
  #   tmp = User.find(:all)
  #   $user = nil
  #   $user = tmp[0].vars if !tmp.nil? && !tmp[0].nil? 
  #   puts "LOGGED IN USER="+$user.inspect
  # end
  # 
end