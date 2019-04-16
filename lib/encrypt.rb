require "./lib/enigma"

class Encrypt

  inputs = ARGV

  abort("Error - wrong number of inputs") if inputs.length < 2 || inputs.length > 4
  abort("Error - invalid inputs") if !(1..99999).to_a.include?(inputs[2].to_i) ||
  !(1..999999).to_a.include?(inputs[3].to_i)
  abort("Error - input file not found") if !File.readable?(inputs.first)
  output = {
    :key => Encryption.fetch_key,
    :date => Encryption.fetch_date
  }

  output[:key] = inputs[2] if inputs.length == 3 || inputs.length == 4
  output[:date] = inputs[3] if inputs.length == 4

  File.open(inputs[1], "w+") do |file|
    File.readlines(inputs[0]).each do |line|
      output = Encryption.encode(line.chomp, output[:key], output[:date])
      file.puts(output[:encryption])
    end
  end

  puts "Created #{inputs[1]} with the key #{output[:key]} and date #{output[:date]}"

end
