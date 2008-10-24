require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a user exists" do
  request(resource(:users), :method => "POST", 
    :params => { :user => {  }})
end

describe "resource(:users)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:users))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of speakers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a user exists" do
    before(:each) do
      @response = request(resource(:users))
    end
    
    it "has a list of users" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      @response = request(resource(:users), :method => "POST", 
        :params => { :user => {  }})
    end
    
    it "redirects to resource(:users)" do
      @response.should redirect_to(resource(User.first), :message => {:notice => "user was successfully created"})
    end
    
  end
end

