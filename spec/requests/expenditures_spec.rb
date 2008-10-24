require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a expenditure exists" do
  request(resource(:expenditures), :method => "POST", 
    :params => { :expenditure => {  }})
end

describe "resource(:expenditures)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:expenditures))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of speakers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a expenditure exists" do
    before(:each) do
      @response = request(resource(:expenditures))
    end
    
    it "has a list of expenditures" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      @response = request(resource(:expenditures), :method => "POST", 
        :params => { :expenditure => {  }})
    end
    
    it "redirects to resource(:expenditures)" do
      @response.should redirect_to(resource(Expenditure.first), :message => {:notice => "expenditure was successfully created"})
    end
    
  end
end

