require "./lib/enigma_setup"

class Encryption
  include EnigmaSetup

  def self.encode(message, key, date)
    encode = EnigmaSetup.shift(message, key, date, "en")
    EnigmaSetup.create_hash(encode, key, date, :encryption)
  end

end
