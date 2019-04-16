class Encrypt

  inputs = ARGV

  abort("Error - input file not found") if !File.readable?(inputs.first)
  abort("Error - wrong number of inputs") if inputs.length != 2

  puts "Created #{inputs.last} with the key #{[:key]} and date #{[:date]}"

end
