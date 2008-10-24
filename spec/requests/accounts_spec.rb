require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a account exists" do
  request(resource(:accounts), :method => "POST", 
    :params => { :account => {  }})
end

describe "resource(:accounts)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:accounts))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of speakers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a account exists" do
    before(:each) do
      @response = request(resource(:accounts))
    end
    
    it "has a list of accounts" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      @response = request(resource(:accounts), :method => "POST", 
        :params => { :account => {  }})
    end
    
    it "redirects to resource(:accounts)" do
      @response.should redirect_to(resource(Account.first), :message => {:notice => "account was successfully created"})
    end
    
  end
end

