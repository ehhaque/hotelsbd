namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #make_users
    make_hotels_coxs
    make_hotels_dhaka
    #make_rooms_dhaka
    #make_rooms_coxs
  end
end

def make_users
  admin = User.new(
                      username: "admin",
                      email: "admin@example.com",
                      password: "1234",
                      password_confirmation: "1234",
                      admin: true
                  )
  admin.skip_confirmation!
  admin.save!

end



def make_hotels_coxs
  users = User.all(limit: 1)

  20.times do |n|
    #content = Faker::Lorem.sentence(5)
    name  = "Sea Side Resort #{n+1}"
    star_rating = "3"
    city = "Coxs Bazaar"
    desc = "Luxury Beach Hotel"
    users.each { |user| user.hotels.create!(name: name,
                                            star_rating: star_rating,
                                            city: city,
                                            desc: desc) 
    }
  end
end

def make_hotels_dhaka
  users = User.all(limit: 1)

  15.times do |n|
    #content = Faker::Lorem.sentence(5)
    name  = "Westin #{n+1}"
    star_rating = "4"
    city = "Dhaka"
    desc = "Luxury City Hotel"
    users.each { |user| user.hotels.create!(name: name,
                                            star_rating: star_rating,
                                            city: city,
                                            desc: desc) 
    }
  end
end

def make_rooms_dhaka
  #hotels = Hotel.all(limit: 1)
  hotel = Hotel.where(:city => 'Dhaka').first

  15.times do |n|
    
    if n%2 > 0
      room_type  = "Suite"
      bed_type = "King"
      num_beds = 1
    else
      room_type  = "Luxury Suite"
      bed_type = "Queen"
      num_beds = 2
    end
    
    price = rand(70..500)
    currency = "$"
    hotel.rooms.create!(room_type: room_type,
                                            bed_type: bed_type,
                                            num_beds: num_beds,
                                            price: price,
                                            currency: currency) 
    
  end
end

def make_rooms_coxs
  #hotels = Hotel.all(limit: 1)
  hotel = Hotel.where(:city => 'Coxs Bazaar').first


  50.times do |n|
    
    if n%2 > 0
      room_type  = "Suite"
      bed_type = "King"
      num_beds = 1
    else
      room_type  = "Luxury Suite"
      bed_type = "Queen"
      num_beds = 2
    end
    
    price = rand(70..500)
    currency = "$"
    hotel.rooms.create!(room_type: room_type,
                                            bed_type: bed_type,
                                            num_beds: num_beds,
                                            price: price,
                                            currency: currency) 
    
  end
end


