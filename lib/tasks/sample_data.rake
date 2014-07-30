namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    
    make_users if Rails.env.production?    
    make_hotels_coxs
    make_hotels_dhaka
    make_hotels_ctg
    make_hotels_sylhet
    make_rooms_dhaka
    make_rooms_coxs
    make_rooms_ctg
    make_rooms_sylhet
    make_cities
    make_room_types
    make_bed_types
    make_star_rating
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

def make_cities
  d = City.new(
                      name: "Dhaka"                      
              )
  d.save!
  d = City.new(
                      name: "Cox Bazaar"                      
              )
  d.save!
  d = City.new(
                      name: "Sylhet"                      
              )
  d.save!
  d = City.new(
                      name: "Chittagong"                      
              )
  d.save!

end


def make_room_types
  d = RoomType.new(
                      name: "Suite Room"                      
              )
  d.save!
  d = RoomType.new(
                      name: "Luxury Room"                      
              )
  d.save!
  d = RoomType.new(
                      name: "Ocean View Room"                      
              )
  d.save!
  d = RoomType.new(
                      name: "AC Room"                      
              )
  d.save!
  d = RoomType.new(
                      name: "Non-AC Room"                      
              )
  d.save!

end

def make_bed_types
  d = BedType.new(
                      name: "King Bed"                      
              )
  d.save!
  d = BedType.new(
                      name: "Queen Bed"                      
              )
  d.save!
  d = BedType.new(
                      name: "Double Bed"                      
              )
  d.save!
  d = BedType.new(
                      name: "Single Bed"                      
              )
  d.save!
  d = BedType.new(
                      name: "Twin Bed"                      
              )
  d.save!

end

def make_star_rating
  d = StarRating.new(
                      rating: "1"
              )
  d.save!
  d = StarRating.new(
                      rating: "2"                      
              )
  d.save!
  d = StarRating.new(
                      rating: "3"                      
              )
  d.save!
  d = StarRating.new(
                      rating: "4"                      
              )
  d.save!
  d = StarRating.new(
                      rating: "5"                      
              )
  d.save!

end


def make_hotels_coxs
  users = User.all(limit: 1)

  3.times do |n|
    #content = Faker::Lorem.sentence(5)
    name  = "Sea Side Resort #{n+1}"
    star_rating = "3"
    city = "Coxs Bazaar"
    desc = "Luxury Beach Hotel"
    address = "Rd 1, H 20"
    users.each { |user| user.hotels.create!(name: name,
                                            star_rating: star_rating,
                                            city: city,
                                            desc: desc,
                                            address: address) 
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
    address = "Rd 1, H 20"
    users.each { |user| user.hotels.create!(name: name,
                                            star_rating: star_rating,
                                            city: city,
                                            desc: desc,
                                            address: address) 
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
    address = "Rd 1, H 20"
    users.each { |user| user.hotels.create!(name: name,
                                            star_rating: star_rating,
                                            city: city,
                                            desc: desc,
                                            address: address) 
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
    address = "Rd 1, H 20"
    users.each { |user| user.hotels.create!(name: name,
                                            star_rating: star_rating,
                                            city: city,
                                            desc: desc,
                                            address: address) 
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
      image = File.open("#{Rails.root}/app/assets/images/dhaka_3.jpg", 'rb')
    else
      room_type  = "Luxury Suite"
      bed_type = "Queen"
      num_beds = 2
      image = File.open("#{Rails.root}/app/assets/images/dhaka_1.jpg", 'rb')
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
    # Add Image
    
    room.paintings.create!(image: image)  
    
  end
end

def make_rooms_coxs
  50.times do |n|
    
    if n%2 > 0
      room_type  = "Suite"
      bed_type = "King"
      num_beds = 1
      image = File.open("#{Rails.root}/app/assets/images/coxs_2.jpg", 'rb')
    else
      room_type  = "Luxury Suite"
      bed_type = "Queen"
      num_beds = 2    
      image = File.open("#{Rails.root}/app/assets/images/coxs_1.jpg", 'rb')
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
    room.save!
    # Add Image
    room.paintings.create!(image: image)  
    
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
    # Add Image
    image = File.open("#{Rails.root}/app/assets/images/Ctg_1.jpg", 'rb')
    room.paintings.create!(image: image)  
    
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
      image = File.open("#{Rails.root}/app/assets/images/syl_2.jpg", 'rb')
    else
      room_type  = "Luxury Suite"
      bed_type = "Queen"
      num_beds = 2
      image = File.open("#{Rails.root}/app/assets/images/syl_1.jpg", 'rb')
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
    # Add Image
    room.paintings.create!(image: image)  

    #MyModel.create!(my_attribute: 'something', 
    #  image: File.open("#{Rails.root}/app/assets/images/syl_1.jpg", 'rb'))
           

    
  end
end

