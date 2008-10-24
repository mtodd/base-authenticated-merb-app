require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a income exists" do
  request(resource(:incomes), :method => "POST", 
    :params => { :income => {  }})
end

describe "resource(:incomes)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:incomes))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of speakers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a income exists" do
    before(:each) do
      @response = request(resource(:incomes))
    end
    
    it "has a list of incomes" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      @response = request(resource(:incomes), :method => "POST", 
        :params => { :income => {  }})
    end
    
    it "redirects to resource(:incomes)" do
      @response.should redirect_to(resource(Income.first), :message => {:notice => "income was successfully created"})
    end
    
  end
end

