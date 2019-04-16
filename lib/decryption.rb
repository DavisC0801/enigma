require "./lib/enigma_setup"

class Decryption
  include EnigmaSetup

  def self.decode(message, key, date)
    decode(message, key, date, "de")
    create_hash(encode, key, date, :decryption)
  end

end
