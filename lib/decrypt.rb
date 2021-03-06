require "./lib/enigma"

class Decrypt

  inputs = ARGV

  abort("Error - wrong number of inputs") if inputs.length != 4
  abort("Error - input file not found") if !File.readable?(inputs.first)
  if (inputs.length == 3 && !(1..99999).to_a.include?(inputs[2].to_i)) \
  || (inputs.length == 4 && !(1..999999).to_a.include?(inputs[3].to_i))
    abort("Error - invalid input")
  end

  output = {}
  File.open(inputs[1], "w+") do |file|
    File.readlines(inputs.first).each do |line|
      output = Decryption.decode(line.chomp, inputs[2], inputs[3])
      file.puts(output[:decryption])
    end
  end

  puts "Created #{inputs[1]} with the key #{output[:key]} and date #{output[:date]}"

end
