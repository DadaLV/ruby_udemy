class Gadget
  
  attr_reader :production_number
  attr_accessor :username, :password

  def initialize(username, password)
    @username = username
    @password = password
    @production_number = generate_production_number
  end

  def to_s
    "Gadget #{production_number} has the username #{username}. It is made from the #{self.class} class and it had th ID #{self.object_id}."
  end

  def password=(new_password)
    @password = new_password if validate_password(new_password)      
  end

  private  

  def generate_production_number
    start_digits = rand(10000..99999)
    end_digits = rand(10000..99999)
    alphabet = ("A".."Z").to_a
    middle_digits = "2023"
    5.times { middle_digits << alphabet.sample }
    "#{start_digits}-#{middle_digits}-#{end_digits}"
  end

  def validate_password(new_password)
    new_password.is_a?(String) && new_password.length >= 6 && new_password =~ /\d/
  end
  
end

phone = Gadget.new("user1", "password1")
p phone.password 

phone.password = "123tytyt"
puts phone.password 


class BankAccount
  
  def initialize
    @amount = 5000
  end

  def status
    "Your bank account has a total of #{amount} dollars"
  end

  private

  def amount
    @amount / 100
  end
end

ba = BankAccount.new  
p ba.status  