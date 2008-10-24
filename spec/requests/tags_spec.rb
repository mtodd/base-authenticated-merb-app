require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a tag exists" do
  request(resource(:tags), :method => "POST", 
    :params => { :tag => {  }})
end

describe "resource(:tags)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:tags))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of speakers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a tag exists" do
    before(:each) do
      @response = request(resource(:tags))
    end
    
    it "has a list of tags" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      @response = request(resource(:tags), :method => "POST", 
        :params => { :tag => {  }})
    end
    
    it "redirects to resource(:tags)" do
      @response.should redirect_to(resource(Tag.first), :message => {:notice => "tag was successfully created"})
    end
    
  end
end

