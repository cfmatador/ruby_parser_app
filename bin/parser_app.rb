require '../lib/parser_app'
puts "Pass 1 2 or 3 as arguments" if ARGV.empty?

ARGV.each do |arg|
	case arg
	when "1"
		ParserApp.new(1)
		puts
	when "2"
		ParserApp.new(2)
		puts
	when "3"
		ParserApp.new(3)
		puts
	else
		puts "Invalid argument expected only 1 2 or 3, got '#{arg}'"
		puts
	end
end