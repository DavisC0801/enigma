require "./lib/encryption"

class Encrypt

  inputs = ARGV

  abort("Error - wrong number of inputs") if inputs.length != 2
  abort("Error - input file not found") if !File.readable?(inputs.first)

  output = {:key => Encryption.fetch_key}

  File.open(inputs.last, "w+") do |file|
    File.readlines(inputs.first).each do |line|
      output = Encryption.encode(line.chomp, output[:key])
      file.puts(output[:encryption])
    end
  end

  puts "Created #{inputs.last} with the key #{output[:key]} and date #{output[:date]}"

end
