require 'csv'
require '../lib/parser/delimiter_sniffer'
require '../lib/parser/field_mapper'

# ParserApp: Accepts data from .txt files and resorts based on a sort type.
class ParserApp
  def initialize(sort_type)
    # Create an empty array. This will be used to store all our people.
    people_arr = []
    Dir['../data/*'].each do |data_file|
      # Populate array with data from each file.
      people_arr.concat(slurp_file(data_file))
    end
    # Return the data based on the sort type. 
    people_arr = case sort_type
                 when 1
                  sort_by_gender_and_last_name(people_arr)
                 when 2
                  sort_by_birth_date_and_last_name(people_arr)
                 when 3
                  sort_by_last_name_desc(people_arr)
                 else
                  raise ArgumentError, "You must specify a sort type. Valid values are: 1,2,3"
                 end
    # Return the results to the console.             
    puts people_arr
  end
  
  # Reads through each line in a file.
  # Determines the delimeter being used
  def slurp_file(file)
    temp_arr = []
    File.foreach(file) do |line|
      # The Delimeter Sniffer determines the delimeter
      # being used. Uses the appropriate data mapper to
      # hydrate the person object.
      myDelimiter = DelimiterSniffer.new.sniff(line)  
      person = FieldMapper.new(line,myDelimiter)
      temp_arr.push(person.mapped_data) 
    end
    temp_arr
  end

  # Sort based on Gender, and Last Name.
  def sort_by_gender_and_last_name(data)
    data.sort!{ |a,b| (a.gender == b.gender) ? 
      sort_by_last_name(a,b) : sort_by_gender(a,b) 
    }.collect!{ |p| "#{p.to_s}" }
  end

  # Sort based on Birth Date, and Last Name.
  def sort_by_birth_date_and_last_name(data)
    data.sort!{ |a,b| (a.date_of_birth == b.date_of_birth) ? 
      sort_by_last_name(a,b) : sort_by_date(a,b) 
    }.collect!{ |p| "#{p.to_s}" }
  end

  # Sort based on Last Name Descending.
  def sort_by_last_name_desc(data)
    data.sort!{ |a,b| sort_by_last_name(b,a) }.collect!{ |p| "#{p.to_s}" }
  end
  
  # Sort based on Last Name Descending.
  def sort_by_last_name(a,b)
    a.last_name <=> b.last_name
  end

  # Sort based on Last Name Descending.
  def sort_by_gender(a,b)
    a.gender <=> b.gender
  end

  # Sort based on Last Name Descending.
  def sort_by_date(a,b)
    Date.strptime(a.date_of_birth,'%m/%d/%Y') <=> Date.strptime(b.date_of_birth,'%m/%d/%Y')
  end

end
