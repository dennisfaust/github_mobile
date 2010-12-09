require 'News/news.rb'

describe "News" do
  
  before(:all) do       
    tmp = '<?xml version="1.0" encoding="UTF-8"?>
    <feed xmlns="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/" xml:lang="en-US">
      <id>tag:github.com,2008:/dennisfaust.private</id>
      <link type="text/html" rel="alternate" href="https://github.com/dennisfaust"/>
      <link type="application/atom+xml" rel="self" href="https://github.com/dennisfaust.private.atom?token=62448070e1090cdd884b29b90694d225"/>
      <title>Private Feed for dennisfaust</title>
      <updated>2010-11-30T12:31:39-08:00</updated>
      <entry>
        <id>tag:github.com,2008:PushEvent/1021965873</id>
        <published>2010-11-30T12:31:39-08:00</published>
        <updated>2010-11-30T12:31:39-08:00</updated>
        <link type="text/html" rel="alternate" href="https://github.com/netbooks/signup/compare/9d9ce8b2f7...9fd3055cdc"/>
        <title>donnoman pushed to master at netbooks/signup</title>
        <author>
          <name>donnoman</name>
          <uri>https://github.com/donnoman</uri>
        </author>
        <media:thumbnail height="30" width="30" url="https://secure.gravatar.com/avatar/ed153d51199eedfc8d0b98653c15ffca?s=30&amp;d=https%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png"/>
        <content type="html"></content>
      </entry>
    </feed>'
    n = News.new
    @parsed_news = n.parse(tmp) 
    puts "News Parsed from file ="+@parsed_news
  end                    

  it "should add a record to the DB" do
    news = News.create(@parsed_news)
    news.length.should == 1 
  end
  
  it "should delete all existing records in the DB" do
     News.delete_all
#     News.find(:all).length.should == 0
  end
  
  
end



