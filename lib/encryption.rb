require "./lib/enigma_setup"

class Encryption
  include EnigmaSetup

  def self.encode(message, key, date)
    encode(message, key, date, "en")
    create_hash(encode, key, date, :encryption)
  end

end
