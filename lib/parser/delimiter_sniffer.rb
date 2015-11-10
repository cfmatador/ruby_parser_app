class DelimiterSniffer
  COMMON_DELIMITERS = [
    ",",
    "|",
    " "
  ].freeze
  
  # Returns the delimiter being used on 
  # a particular line of data.
  # Would re-write this method to not require the 
  # explicit "|" return 
  # (Sniffer was incorrectly returning space for the delimiter).
  def sniff(data_row)
    return nil unless data_row
    return "|" unless !data_row.strip.include? " | "

    sniff = {}

    COMMON_DELIMITERS.each do |delim| 
      sniff[delim]=data_row.count(delim)
    end
    sniff = sniff.sort {|a,b| b[1]<=>a[1]}
    sniff.size > 0 ? sniff[0][0]: nil
  end
end