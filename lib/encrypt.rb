require "./lib/enigma"

class Encrypt

  def self.encode(message, key = fetch_key, date = fetch_date)
    keys = Enigma.create_keys(key)
    base = Enigma.generate_characters()
    date_key = Enigma.generate_date_key(date)
    keys = Enigma.add_offsets(keys, date_key)
    encoded = ""
    index = 0
    message.downcase.each_char do |char|
      char.find
      index += 1
    end
    require 'pry'; binding.pry

    return Enigma.create_hash(message, key, date, :encrypt)
  end

  def self.fetch_key
    rand.to_s[2..6]
  end

  def self.fetch_date
    today = Date.today
    today.strftime('%d%m%y')
  end

end
