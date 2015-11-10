require 'minitest/autorun'
require_relative '../lib/parser/delimiter_sniffer'
require_relative '../lib/parser/person'
require_relative '../lib/parser/field_mapper'

describe "FieldMapper" do
	before :all do 
	  @row_spaces = "Thomson Joe J M 1-21-2015 Purple"
	  @row_pipes = "Thomson | Joe | J | M | Purple | 3-3-1985"
	  @row_commas = "Thomson, Joe, Male, Purple, 3/4/2015"
	  @row_invalid = "Thomson/Joe/Male/1/21/2015"
	  @mapped_person_by_pipe = FieldMapper.new(@row_pipes,"|").mapped_data
	  @mapped_person_by_comma = FieldMapper.new(@row_commas,", ").mapped_data
	  @mapped_person_by_space = FieldMapper.new(@row_spaces," ").mapped_data
	end

	it "should return First Name when pipe is the delimiter" do
	  @mapped_person_by_pipe.first_name.must_equal "Joe"
	end

	it "should return Last Name when pipe is the delimiter" do
	  @mapped_person_by_pipe.last_name.must_equal "Thomson"
	end

	it "should return the Gender when pipe is the delimiter" do
      @mapped_person_by_pipe.gender.must_equal "Male"
	end

	it "should return the Date of Birth when pipe is the delimiter" do
      @mapped_person_by_pipe.date_of_birth.must_equal "3/3/1985"
	end

	# Test Comma delimited field mapper.
	it "should return First Name when comma is the delimiter" do
	  @mapped_person_by_comma.first_name.must_equal "Joe"
	end

	it "should return Last Name when comma is the delimiter" do
	  @mapped_person_by_comma.last_name.must_equal "Thomson"
	end

	it "should return the Gender when comma is the delimiter" do
      @mapped_person_by_comma.gender.must_equal "Male"
	end

	it "should return the Date of Birth when comma is the delimiter" do
      @mapped_person_by_comma.date_of_birth.must_equal "3/4/2015"
	end

	# Test Space delimited field mapper.
	it "should return First Name when space is the delimiter" do
	  @mapped_person_by_space.first_name.must_equal "Joe"
	end

	it "should return Last Name when space is the delimiter" do
	  @mapped_person_by_space.last_name.must_equal "Thomson"
	end

	it "should return the Gender when space is the delimiter" do
      @mapped_person_by_space.gender.must_equal "Male"
	end

	it "should return the Date of Birth when space is the delimiter" do
      @mapped_person_by_space.date_of_birth.must_equal "1/21/2015"
	end

	it "should fail to parse when invalid data is attempted to be mapped" do
	  must_raise(Exception) { @mapped_person_by_invalid = FieldMapper.new(@row_invalid,"/").mapped_data }
	end
end