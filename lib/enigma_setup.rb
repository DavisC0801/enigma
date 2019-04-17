require "date"

module EnigmaSetup

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

  def self.fetch_key
    rand.to_s[2..6]
  end

  def self.fetch_date
    Date.today.strftime('%d%m%y')
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

  def self.setup(key, date)
    keys = create_keys(key)
    base = generate_characters
    date_key = generate_date_key(date)
    keys = add_offsets(keys, date_key)
    return {
      :base => base,
      :keys => keys
    }
  end

  def self.shift(message, key, date, en_or_de)
    setup = setup(key, date)
    message_array = get_message_array(message)
    encode = ""
    message_array.each_with_index do |char, index|
      if setup[:base].key?(char)
        if en_or_de == "en"
          temp = (setup[:base][char] + setup[:keys][index % setup[:keys].length])
        else
          temp = (setup[:base][char] - setup[:keys][index % setup[:keys].length])
        end
        encode += setup[:base].key(temp % setup[:base].count)
      else
        encode += char
      end
    end
    return encode
  end
end
