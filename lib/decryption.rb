require "./lib/enigma"

class Decryption

  def self.decode(message, key, date)
    setup = setup(key, date)
    message_array = Enigma.get_message_array(message)
    encode = ""
    message_array.each_with_index do |char, index|
      if setup[:base].key?(char)
        temp = (setup[:base][char] - setup[:keys][index % setup[:keys].length])
        encode += setup[:base].key(temp % setup[:base].count)
      else
        encode += char
      end
    end

    Enigma.create_hash(encode, key, date, :decryption)
  end

  def self.setup(key, date)
    keys = Enigma.create_keys(key)
    base = Enigma.generate_characters()
    date_key = Enigma.generate_date_key(date)
    keys = Enigma.add_offsets(keys, date_key)
    return {
      :base => base,
      :keys => keys
    }
  end

end
