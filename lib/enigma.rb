class Enigma

  def self.generate_characters
    characters = ("a".."z").to_a << " "
    characters.each_with_index.map{|char, index| [char, index]}.to_h
  end

  def self.create_keys(key)
    key_array = []
    key = key.split ""
    key.each_cons(2){|ele| key_array << ele}
    key_array.map{|x| x.join}
  end

  def self.create_hash(message, key, date, en_or_de)
    {
      en_or_de => message,
      :key => key,
      :date => date
    }
  end

  def self.generate_date_key(date)
    (date.to_i ** 2).to_s[-4..-1]
  end

  def self.add_offsets(keys, date_key)
    keys.each_with_index.map{|key, index| key.to_i + date_key[index].to_i}
  end

  def self.get_message_array(message)
    message.downcase.chars
  end

end
