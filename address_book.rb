require './lib/contact'

@current_contact = nil

def main_menu
  loop do
    if Contact.all == []
      puts "Please enter a contact"
    else
      contact_list
    end
    puts "Press 'a' to add a new contact"
    puts "Press 'c to view all contacts"
    puts "Press 'x' to exit"
    main_choice = gets.chomp
    if main_choice == 'a'
      add_contact
    elsif main_choice == 'c'
      contact_list
    elsif main_choice == 'x'
      puts "Goodbye!"
      exit
    end
  end
end

def add_contact
  puts "Enter a new contact name:"
  input = gets.chomp
  Contact.new(input).save
  Contact.all.each do |contact|
    @current_contact = contact
  end

  puts "Contact created.\n\n"

  puts "Enter in the phone number you would like to add:"
  user_number = gets.chomp
  @current_contact.add_phone(user_number)
  puts "Phone number added!\n\n"

  puts "Enter in the address you would like to add:"
  user_address = gets.chomp
  @current_contact.add_address(user_address)
  puts "Address added!\n\n"

  puts "Enter in the email address you would like to add:"
  user_email = gets.chomp
  @current_contact.add_email(user_email)
  puts "Email added!\n\n"
  main_menu
end

def add_phone_ui
  puts "Enter in the phone number you would like to add:"
  user_number = gets.chomp
  @current_contact.add_phone(user_number)
  puts "Phone number added!\n\n"
end

def add_address_ui
  puts "Enter in the address you would like to add:"
  user_address = gets.chomp
  @current_contact.add_address(user_address)
  puts "Address added!\n\n"
end

def add_email_ui
  puts "Enter in the email address you would like to add:"
  user_email = gets.chomp
  @current_contact.add_email(user_email)
  puts "Email added!\n\n"
end

def contact_list
  puts "Here are all of your contacts:"

  Contact.all.each do |contact|
    @contact_number = Contact.all.index(contact).to_s
    puts @contact_number + " " + contact.name
  end

  puts "Press 'a' to add a new contact"
  puts "Press 'v' to view a contact's info"
  puts "Press 'e' to edit a contact"
  response = gets.chomp
  if response == 'a'
    add_contact
  elsif response == 'v'
    view_info
  elsif response == 'e'
    edit_info
  end
end

def view_info
  puts "Enter the number of the contact you would like to view:"
  response = gets.chomp
  Contact.all.each do |contact|
    if response == @contact_number
      @current_contact = contact
    end
  end

  puts @current_contact.name
  puts @current_contact.phone
  puts @current_contact.email
  puts @current_contact.address
end

def edit_info
  puts "Which contact would you like to edit?"
  response = gets.chomp
  Contact.all.each do |contact|
    if response == @contact_number
      @current_contact = contact
    end
  end

  puts "Press 'p' to add a phone number"
  puts "Press 'a' to add an address"
  puts "Press 'e' to add an email address"
  puts "Press 'x' to return to the main_menu"
  choice = gets.chomp
  if choice == 'p'
    add_phone_ui
  elsif choice == 'a'
    add_address_ui
  elsif choice == 'e'
    add_email_ui
  elsif choice == 'x'
    main_menu
  end
end

main_menu
