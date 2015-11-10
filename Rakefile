
task :default do
	puts "'rake test' runs tests."
end

task :test do 
  Dir.glob("./tests/test*.rb").each{ |file| require file }
end

task :person_test do 
  ruby "./tests/test_person.rb"
end

task :delimiter_sniffer_test do 
  ruby "./tests/test_delimiter_sniffer.rb"
end

task :test_field_mapper do
  ruby "./tests/test_field_mapper.rb"
end