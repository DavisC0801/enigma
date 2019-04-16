require "./lib/enigma_setup"
class Cracker
  include EnigmaSetup

  def self.crack(message, date = Enigma.fetch_date)
    message_attack = Enigma.get_message_array(message)
    date_key = Enigma.generate_date_key(date)
    base = Enigma.generate_characters
    cracked = false
    key = 0
    until cracked
      key += 1
      keys = Enigma.create_keys(key.to_s.rjust(5, "0"))
      keys = Enigma.add_offsets(keys, date_key)
      encode = ""
      message_attack.each_with_index do |char, index|
        temp = (base[char] - keys[index % keys.length])
        encode += base.key(temp % base.count)
      end
      if encode[-4..-1] == " end"
        cracked = true
        return Decryption.decode(message, key.to_s.rjust(5, "0"), date)
      end
    end
  end
end
