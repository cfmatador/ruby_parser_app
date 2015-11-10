require_relative '../../lib/parser/person'

#   Maps the incoming data to a Person object, based on an appropriate mapper method.
class FieldMapper
  attr_accessor :delimeter_type, :data, :mapped_data
  
  # Accepts data, and a delimter to call the proper mapper.
  def initialize(data, delimiter)
    @data = data
    
    case delimiter.gsub(/\s+/,'')
	  when '|'
	    pipe_data_mapper
	  when ','
	    comma_data_mapper
	  else
	    spaces_data_mapper
	  end    
  end
  
  # Space Data Mapper: parses and hydrates a 
  # Person object from space delimitted data.
  def spaces_data_mapper
  	fields = @data.split(' ')
	
    person = Person.new
    person.first_name = fields[1]
    person.last_name = fields[0]
    person.gender = fields[3]
    person.date_of_birth = fields[4]
    person.favorite_color = fields[5]
	
    @mapped_data = person
  end
  
  # Comma Data Mapper: parses and hydrates a 
  # Person from comma delimitted data.
  def comma_data_mapper
    fields = @data.split(', ')
	
	  person = Person.new
    person.first_name = fields[1]
    person.last_name = fields[0]
    person.gender = fields[2]
    person.date_of_birth = fields[4]
    person.favorite_color = fields[3]
  
    @mapped_data = person	  
  end
  
  # Pipe Data Mapper: parses and hydrates a 
  # Person from pipe delimitted data.
  def pipe_data_mapper
    fields = @data.split(' | ')
	
    person = Person.new
    person.first_name = fields[1]
    person.last_name = fields[0]
    person.gender = fields[3]
    person.date_of_birth = fields[5]
    person.favorite_color = fields[4]
  
    @mapped_data = person
  end
  
end