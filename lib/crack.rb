require "./lib/decryption"
require "./lib/encryption"
require "./lib/cracker"

class Crack

  inputs = ARGV

  abort("Error - wrong number of inputs") if inputs.length < 2 || inputs.length > 3
  abort("Error - input file not found") if !File.readable?(inputs.first)

  output = {
    :date => Encryption.fetch_date
  }
  output[:date] = inputs[2] if inputs.length == 3

  File.open(inputs[1], "w+") do |file|
    File.readlines(inputs.first).each do |line|
      output = Cracker.crack(line.chomp, output[:date])
      file.puts(output[:decryption])
    end
  end

  puts "Created #{inputs[1]} with the key #{output[:key]} and date #{output[:date]}"

end
