require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a category exists" do
  request(resource(:categories), :method => "POST", 
    :params => { :category => {  }})
end

describe "resource(:categories)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:categorys))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of speakers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a category exists" do
    before(:each) do
      @response = request(resource(:categories))
    end
    
    it "has a list of categories" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      @response = request(resource(:categories), :method => "POST", 
        :params => { :category => {  }})
    end
    
    it "redirects to resource(:categories)" do
      @response.should redirect_to(resource(Category.first), :message => {:notice => "category was successfully created"})
    end
    
  end
end

