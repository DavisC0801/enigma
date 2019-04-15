require "./lib/enigma"

class Encrypt

  def self.encode(message, key = fetch_key, date = fetch_date)
    setup = setup(key, date)
    message_array = Enigma.get_message_array(message)
    encode = ""

    message_array.each_with_index do |char, index|
      temp = setup[:base][char] + setup[:keys][index % 4]
      encode += setup[:base].key \
      (temp - (setup[:base].count * (temp / setup[:base].count)))
    end

    return Enigma.create_hash(encode, key, date, :encryption)
  end

  def self.fetch_key
    rand.to_s[2..6]
  end

  def self.fetch_date
    Date.today.strftime('%d%m%y')
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
