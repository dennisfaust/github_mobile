describe "News" do
  
  before(:all) do
    test_a = [{"title"=>"donnoman pushed to master at netbooks/signup",
     "author"=>{"name"=>"donnoman", "uri"=>"https://github.com/donnoman"},
     "media:thumbnail"=>
      {"url"=>
        "https://secure.gravatar.com/avatar/ed153d51199eedfc8d0b98653c15ffca?s=30&d=https%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
       "height"=>"30",
       "width"=>"30"},
     "published"=>"2010-11-05T13:10:14-07:00",
     "id"=>"tag:github.com,2008:PushEvent/380964423",
     "content"=>
      "\n\n\n\n\n\n\n<div class=\"details\">\n  \n\n  \n    <div class=\"commits\">\n    <ul>\n    \n      \n      <li>\n        \n          <a href=\"https://github.com/rtomsmith\" class=\"committer\">rtomsmith</a>\n        \n        committed\n        <code><a href=\"/netbooks/signup/commit/465e6304315ef876cbf442328a893ba9afd26b8a\">465e630</a></code>\n\n        <div class=\"message\">\n          <blockquote>Added signup activity reports</blockquote>\n        </div>\n      </li>\n    \n      \n      <li>\n        \n          <a href=\"https://github.com/donnoman\" class=\"committer\">donnoman</a>\n        \n        committed\n        <code><a href=\"/netbooks/signup/commit/d557ce7f7eb01a483c696aeebe9d57fe48ed3c7e\">d557ce7</a></code>\n\n        <div class=\"message\">\n          <blockquote>added spec test for creating free and paid accounts</blockquote>\n        </div>\n      </li>\n    \n\n    \n    </ul>\n    </div>\n  \n</div>\n\n\n",
     "link"=>
      {"href"=>
        "https://github.com/netbooks/signup/compare/547a4094ef...465e630431",
       "rel"=>"alternate",
       "type"=>"text/html"},
     "updated"=>"2010-11-05T13:10:14-07:00"},
    {"title"=>"donnoman created tag 1288987744 at netbooks/signup",
     "author"=>{"name"=>"donnoman", "uri"=>"https://github.com/donnoman"},
     "media:thumbnail"=>
      {"url"=>
        "https://secure.gravatar.com/avatar/ed153d51199eedfc8d0b98653c15ffca?s=30&d=https%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
       "height"=>"30",
       "width"=>"30"},
     "published"=>"2010-11-05T13:10:08-07:00",
     "id"=>"tag:github.com,2008:CreateEvent/380964368",
     "content"=>
      "\n\n\n\n\n\n<div class=\"details\">\n  \n  <div class=\"message\">\n    \n      New tag is at\n      <a href=\"https://github.com/netbooks/signup/tree/1288987744\">netbooks/signup/tree/1288987744</a>\n      \n    \n  </div>\n</div>\n",
     "link"=>
      {"href"=>"https://github.com/netbooks/signup/tree/1288987744",
       "rel"=>"alternate",
       "type"=>"text/html"},
     "updated"=>"2010-11-05T13:10:08-07:00"},
    {"title"=>"donnoman pushed to annual_pricing at netbooks/signup",
     "author"=>{"name"=>"donnoman", "uri"=>"https://github.com/donnoman"},
     "media:thumbnail"=>
      {"url"=>
        "https://secure.gravatar.com/avatar/ed153d51199eedfc8d0b98653c15ffca?s=30&d=https%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
       "height"=>"30",
       "width"=>"30"},
     "published"=>"2010-11-05T11:51:44-07:00",
     "id"=>"tag:github.com,2008:PushEvent/380848691",
     "content"=>
      "\n\n\n\n\n\n\n<div class=\"details\">\n  \n\n  \n    <div class=\"commits\">\n    <ul>\n    \n      \n      <li>\n        \n          <a href=\"https://github.com/donnoman\" class=\"committer\">donnoman</a>\n        \n        committed\n        <code><a href=\"/netbooks/signup/commit/479d11b90b3b4943847f9e38aaed4bbaace1da59\">479d11b</a></code>\n\n        <div class=\"message\">\n          <blockquote>fix for renewal_period on welcome message</blockquote>\n        </div>\n      </li>\n    \n\n    \n    </ul>\n    </div>\n  \n</div>\n\n\n",
     "link"=>
      {"href"=>
        "https://github.com/netbooks/signup/compare/21fe5eded2...479d11b90b",
       "rel"=>"alternate",
       "type"=>"text/html"},
     "updated"=>"2010-11-05T11:51:44-07:00"},
    {"title"=>"donnoman pushed to annual_pricing at netbooks/signup",
     "author"=>{"name"=>"donnoman", "uri"=>"https://github.com/donnoman"},
     "media:thumbnail"=>
      {"url"=>
        "https://secure.gravatar.com/avatar/ed153d51199eedfc8d0b98653c15ffca?s=30&d=https%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
       "height"=>"30",
       "width"=>"30"},
     "published"=>"2010-11-05T11:49:28-07:00",
     "id"=>"tag:github.com,2008:PushEvent/380842029",
     "content"=>
      "\n\n\n\n\n\n\n<div class=\"details\">\n  \n\n  \n    <div class=\"commits\">\n    <ul>\n    \n      \n      <li>\n        \n          <a href=\"https://github.com/donnoman\" class=\"committer\">donnoman</a>\n        \n        committed\n        <code><a href=\"/netbooks/signup/commit/21fe5eded22495eaac1295c2e950ea77c634ad37\">21fe5ed</a></code>\n\n        <div class=\"message\">\n          <blockquote>fix for renewal_period on welcome message</blockquote>\n        </div>\n      </li>\n    \n\n    \n    </ul>\n    </div>\n  \n</div>\n\n\n",
     "link"=>
      {"href"=>
        "https://github.com/netbooks/signup/compare/e29755e0b3...21fe5eded2",
       "rel"=>"alternate",
       "type"=>"text/html"},
     "updated"=>"2010-11-05T11:49:28-07:00"}]
  end
  
  #this test always fails, you really should have tests!

  it "should have tests" do
    true.should == false
  end
end