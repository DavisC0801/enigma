require "./lib/enigma"
require "./lib/enigma_setup"

class Crack

  inputs = ARGV

  abort("Error - wrong number of inputs") if inputs.length < 2 || inputs.length > 3
  abort("Error - input file not found") if !File.readable?(inputs.first)

  output = {
    :date => EnigmaSetup.fetch_date
  }
  output[:date] = inputs[2] if inputs.length == 3

  File.open(inputs[1], "w+") do |file|
    output = Cracker.crack(File.readlines(inputs.first).last.chomp, output[:date])
    File.readlines(inputs.first).each do |line|
      output = Decryption.decode(line.chomp, output[:key], output[:date])
      file.puts(output[:decryption])
    end
  end

  puts "Created #{inputs[1]} with the key #{output[:key]} and date #{output[:date]}"

end
