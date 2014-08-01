class Contact
  @@all_contacts = []

  def initialize(name)
    @name = name
    @phone = []
    @email = []
    @address = []
  end

  def name
    @name
  end

  def phone
    @phone
  end

  def email
    @email
  end

  def address
    @address
  end

  def add_phone(phone)
    @phone << phone
  end

  def add_email(email)
    @email << email
  end

  def add_address(address)
    @address << address
  end

  def save
    @@all_contacts << self
  end

  def Contact.all
    @@all_contacts
  end
end
