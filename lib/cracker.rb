require "./lib/enigma_setup"

class Cracker
  include EnigmaSetup

  def self.crack(message, date = EnigmaSetup.fetch_date)
    message_attack = EnigmaSetup.get_message_array(message)
    date_key = EnigmaSetup.generate_date_key(date)
    base = EnigmaSetup.generate_characters
    cracked = false
    key = 0
    until cracked
      key += 1
      keys = EnigmaSetup.create_keys(key.to_s.rjust(5, "0"))
      keys = EnigmaSetup.add_offsets(keys, date_key)
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
