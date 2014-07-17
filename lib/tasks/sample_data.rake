namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_hotels_coxs
    make_hotels_dhaka
    make_hotels_ctg
    make_hotels_sylhet
    make_rooms_dhaka
    make_rooms_coxs
    make_rooms_ctg
    make_rooms_sylhet
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

  user1 = User.new(
                      username: "user1",
                      email: "user1@example.com",
                      password: "1234",
                      password_confirmation: "1234",
                      admin: false
                  )
  user1.skip_confirmation!
  user1.save!

end



def make_hotels_coxs
  users = User.all(limit: 1)

  3.times do |n|
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

def make_hotels_ctg
  users = User.all(limit: 1)

  3.times do |n|
    #content = Faker::Lorem.sentence(5)
    name  = "Hotel Agrabad #{n+1}"
    star_rating = "3"
    city = "Chittagong"
    desc = "Luxury City Hotel"
    users.each { |user| user.hotels.create!(name: name,
                                            star_rating: star_rating,
                                            city: city,
                                            desc: desc) 
    }
  end
end

def make_hotels_dhaka
  users = User.all(limit: 1)

  3.times do |n|
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

def make_hotels_sylhet
  users = User.all(limit: 1)

  3.times do |n|
    #content = Faker::Lorem.sentence(5)
    name  = "NaziNagar Resort #{n+1}"
    star_rating = "4"
    city = "Sylhet"
    desc = "Tea Estate Resort"
    users.each { |user| user.hotels.create!(name: name,
                                            star_rating: star_rating,
                                            city: city,
                                            desc: desc) 
    }
  end
end

def make_rooms_dhaka
  #hotels = Hotel.all(limit: 1)
  #hotel = Hotel.where(:city => 'Dhaka').first

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
    hotel_id = "4"
    
    price = rand(70..500)
    currency = "$"
    room = Room.new(room_type: room_type,
                                            bed_type: bed_type,
                                            num_beds: num_beds,
                                            price: price,
                                            currency: currency,
                                            hotel_id: hotel_id) 
    room.save!
    
  end
end

def make_rooms_coxs
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
    hotel_id = "1"
    price = rand(70..500)
    currency = "$"
    room = Room.new(room_type: room_type,
                                            bed_type: bed_type,
                                            num_beds: num_beds,
                                            price: price,
                                            currency: currency,
                                            hotel_id: hotel_id) 
    
  end
end

def make_rooms_ctg
  #hotels = Hotel.all(limit: 1)
  #hotel = Hotel.where(:city => 'Dhaka').first

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
    hotel_id = "7"
    
    price = rand(70..500)
    currency = "$"
    room = Room.new(room_type: room_type,
                                            bed_type: bed_type,
                                            num_beds: num_beds,
                                            price: price,
                                            currency: currency,
                                            hotel_id: hotel_id) 
    room.save!
    
  end
end

def make_rooms_sylhet
  #hotels = Hotel.all(limit: 1)
  #hotel = Hotel.where(:city => 'Dhaka').first

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
    hotel_id = "10"
    
    price = rand(70..500)
    currency = "$"
    room = Room.new(room_type: room_type,
                                            bed_type: bed_type,
                                            num_beds: num_beds,
                                            price: price,
                                            currency: currency,
                                            hotel_id: hotel_id) 
    room.save!
    
  end
end

