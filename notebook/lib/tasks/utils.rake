namespace :utils do
  desc "Popular bando de dados."
  task seed: :environment do
    puts "Gerendo os contatos (Contacts)..."
      10.times do |i|  
        Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          Kind: Kind.all.sample,
          rmk: Faker::Lorem.paragraph([1,2,3,4,6].sample)
        )
    end
  puts "Gerendo os contatos (Contacts)... [OK]"
  
  
  puts "Gerendo os endereços (Addresses)..."
    Contact.all.each do |_contact| 
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city, 
        state:Faker::Address.state_abbr,
        contact: _contact
      )
    end
  puts "Gerendo os endereços (addresses)...[OK]"
  
  
    puts "Gerendo os telefones (Phones)..."
        Contact.all.each do |contact|
         Random.rand(1..5).times do |i|
          Phone.create!(
            phone: Faker::PhoneNumber.phone_number,
            contact: contact
          )
      end
    end
  puts "Gerendo os telefones (Phones)...[OK]"
   
  end

end
