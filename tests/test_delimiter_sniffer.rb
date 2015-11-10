require 'minitest/autorun'
require_relative '../lib/parser/delimiter_sniffer'
require_relative '../lib/parser/person'

describe "DelimiterSniffer" do
	before :all do 
	  @row_spaces = "Thomson Joe Male 1/1/2015"
	  @row_pipes = "Thomson | Joe | Male | 1/1/2015"
	  @row_commas = "Thomson, Joe, Male, 1/1/2015"
	  @row_invalid = "Thomson/Joe/Male/1/1/2015"
	  @delimiter_sniffer = DelimiterSniffer.new
	end

	it "should return pipe when pipe is the delimiter" do
	  @delimiter_sniffer.sniff(@row_pipes).must_equal "|"
	end

	it "should return comma when comma is the delimiter" do
	  @delimiter_sniffer.sniff(@row_commas).must_equal ","
	end

	it "should return space when space is the delimiter" do
	  @delimiter_sniffer.sniff(@row_spaces).must_equal " "
	end

	it "should raise an error is passed and invalid format." do
	  must_raise(Exception) { @delimiter_sniffer.sniff(@row_invalid) }
	end
end