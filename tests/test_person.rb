require 'minitest/autorun'
require_relative '../lib/parser/person'

describe "Person" do
  before :all do 
  	@person = Person.new
  end

  it "should return full gender name Male" do
  	@person.gender = "m"
    @person.gender.must_equal "Male"
  end
  
  it "should return full gender name Female" do
    @person.gender = "f"
    @person.gender.must_equal "Female"
  end
  
  it "should return blank gender when not set" do
    @person.gender = ""
    @person.gender.must_equal ""
  end
  
  it "should accept date of birth in US format" do
  	@person.date_of_birth = '02/12/2015'
  	@person.date_of_birth.must_equal "2/12/2015"
  end
  
  it "should accept date of birth with hyphens" do
  	@person.date_of_birth = '02-18-2015'
  	@person.date_of_birth.must_equal "2/18/2015"
  end

  it "should error when it gets an unexpected date format" do
  	@person.date_of_birth = '18-22-2015'
  	must_raise(Exception) { @person.date_of_birth }
  end

  it "should return a specific string format order" do
  	@person.first_name = "Joe"
  	@person.last_name = "Thomson"
  	@person.favorite_color = "Red"
  	@person.date_of_birth = "1/1/2015"
  	@person.gender = "m"
  	@person.to_s.must_equal "Thomson Joe Male 1/1/2015 Red"
  end

end
