class Enigma

  def self.generate_characters
    charactors = ("a".."z").to_a << " "
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
    new_keys = []
    keys.each_with_index{|x, i| new_keys << x.to_i + date_key[i].to_i}
    new_keys
  end

end
