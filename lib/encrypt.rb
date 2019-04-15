require "./lib/enigma"

class Encrypt

  def self.encode(message, key = fetch_key, date = fetch_date)
    
  end

  def self.fetch_key
    rand.to_s[2..6]
  end

  def self.fetch_date
    today = Date.today
    today.strftime('%d%m%y')
  end

end
