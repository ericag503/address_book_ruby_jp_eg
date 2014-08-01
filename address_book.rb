require './lib/contact'

@contact_list = []
@current_contact = nil

def main_menu
  loop do
    puts "Press 'a' to add a new contact"
    puts "Press 's' to see all your contacts"
    puts "Press 'x' to exit"
    main_choice = gets.chomp
    if main_choice == 'a'
      add_contact
    elsif main_choice == 's'
      see_contacts
    elsif main_choice == 'x'
      puts "Goodbye!"
      exit
    end
  end
end

def add_contact
  puts "Enter a new contact name:"
  input = gets.chomp
  @contact_list << Contact.new(input)
  puts "Contact created.\n\n"

  puts "Would you like to add info to a contact?"
  response = gets.chomp
  if response == "yes" || response == "y"
    see_contacts
  elsif response == "no" || response == "n"
    main_menu
  end
end

def add_phone_ui
  puts "Enter in the phone number you would like to add:"
  user_number = gets.chomp.to_i
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

def see_contacts
  puts "Here are all of your contacts:"
  @contact_list.each do |contact|
    @contact_number = @contact_list.index(contact).to_s
    puts @contact_number + " " + contact.name

  puts "Which contact would you like to edit?"
  response = gets.chomp
  @contact_list.each do |contact|
    if response == @contact_number
      @current_contact = contact
    end
  end

  @current_name = @current_contact.name
  puts @current_name

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
end



main_menu
