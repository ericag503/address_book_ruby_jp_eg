require 'rspec'
require 'contact'
require 'phone'
require 'email'
require 'address'

describe Contact do
  it 'is initialized with a name' do
    test_name = Contact.new('John Doe')
    expect(test_name).to be_an_instance_of Contact
  end

  it 'outputs the name' do
    test_name = Contact.new('John Doe')
    expect(test_name.name).to eq 'John Doe'
  end

  it 'adds a phone number' do
    test_name = Contact.new('John Doe')
    test_phone = '555-123-4567'
    test_name.add_phone(test_phone)
    expect(test_name.phone).to eq ['555-123-4567']
  end

  it 'adds an address' do
    test_name = Contact.new('John Doe')
    test_address = '123 Main Street'
    test_name.add_address(test_address)
    expect(test_name.address).to eq ['123 Main Street']
  end

  it 'adds an email address' do
    test_name = Contact.new('John Doe')
    test_email = 'jdoe@gmail.com'
    test_name.add_email(test_email)
    expect(test_name.email).to eq ['jdoe@gmail.com']
  end

end



