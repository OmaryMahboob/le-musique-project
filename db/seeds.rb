# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

mahboob = User.create!(
  full_name: "mahboob",
  nickname: "omary",
  phone: "098876544",
  address: "Magazinstraße 15-16, 10179 Berlin",
  email: "mahboob@gmail.com",
  password: "123456"
)

mahboob.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667037206/tri21is6dulhoce0cocq.jpg"),
  filename: "profile_picture_mahboob.jpeg",
  content_type: "image/jpg"
)
mahboob.save

mahboob_Band = Band.create!(
  band_name: "Electric",
  band_style: "The perfect rubab for lease is an instrument with a warm, resonant sound and a beautiful, polished
                finish.",
  price: rand(2.0..20.0).round(2),
  user: mahboob,
  address: mahboob.address
)

mahboob_Band.photos.attach(
  io: URI.open("https://dailymusicroll.s3.us-west-2.amazonaws.com/wp-content/uploads/2022/04/21160802/5499313034_11ba8fdcf8_b.jpg"),
  filename: "photo_rubab1.jpeg",
  content_type: "image/jpg"
)
mahboob.save

mahboob_Band.photos.attach(
  io: URI.open("https://i.guim.co.uk/img/media/bdc6551c0615762ef8e523dedfbe72a0daacc722/0_197_1791_1075/master/1791.jpg?width=1200&quality=85&auto=format&fit=max&s=1f7e5f7a7df79bf5936284cc52d2da18"),
  filename: "photo_rubab2.jpeg",
  content_type: "image/jpg"
)
mahboob.save

mahboob_Band.photos.attach(
  io: URI.open("https://i.ytimg.com/vi/RCabnDJ8Tgc/maxresdefault.jpg"),
  filename: "photo_rubab3.jpeg",
  content_type: "image/jpg"
)
mahboob.save

jane = User.create(
  full_name: "Jane",
  nickname: "Eme",
  phone: "098876544",
  address: "Straßmannstraße 1, 10249 Berlin",
  email: "martins@test.com",
  password: "123456"
)

jane_Band = Band.create!(
  band_name: "Neon skies",
  band_style: "Fusion of Electric and Blues",
  price: rand(2.0..20.0).round(2),
  user: jane,
  address: jane.address
)

jane_Band.photos.attach(
  io: URI.open("https://www.musicalortiz.com/wp-content/uploads/2021/11/Marimba.jpg"),
  filename: "photo_marimba.jpeg",
  content_type: "image/jpg"
)
jane.save

jane.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667074864/tkaswximthoisj8cucbd.jpg"),
  filename: "profile_picture_jane.jpeg",
  content_type: "image/jpg"
)
jane.save

roger = User.create(
  full_name: "Roger",
  nickname: "Silva",
  phone: "017676490923",
  address: "Goslarer Ufer 3, 10589 Berlin",
  email: "roger.silva@live.cl",
  password: "123456"
)

roger.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1678216566/dp1l8wttyzcs2ynmpbqf.jpg"),
  filename: "profile_picture_roger.jpeg",
  content_type: "image/jpg"
)
roger.save

roger_Band = Band.create!(
  band_name: "Whiskey Rebels",
  band_style: "Fusion of alternative and psychedelic rock.",
  price: rand(2.0..20.0).round(2),
  user: roger,
  address: roger.address
)
roger_Band.photos.attach(
  io: URI.open("https://musiculum.de/wp-content/uploads/2021/02/Charango.jpg"),
  filename: "photo_charango1.jpeg",
  content_type: "image/jpg"
)
roger.save

first_names = ["Avery", "Blake", "Cameron", "Charlie", "Dakota", "Drew", "Eliot", "Emerson", "Frankie", "Harley",
               "Hayden", "Hunter", "Jamie", "Jesse", "Jordan", "Jules", "Kai", "Kelly", "Kendall", "Lee", "Logan",
               "Max", "Morgan", "Noah", "Parker", "Phoenix", "Quinn", "Reagan", "Reese", "River", "Robin", "Rowan",
               "Sage", "Sam", "Sawyer", "Shawn", "Sidney", "Skyler", "Spencer", "Stevie", "Tanner", "Tatum",
               "Taylor", "Tristan", "Tyler", "Vivian", "Wesley", "Zion"]

sample_address = ["Friedrichstraße", "Potsdamer Platz", "Unter den Linden", "Kurfürstendamm", "Alexanderplatz",
                  "Karl-Marx-Straße", "Oranienburger Straße", "Kastanienallee", "Torstraße", "Simon-Dach-Straße",
                  "Schönhauser Allee", "Warschauer Straße", "Kottbusser Tor", "Sonnenallee", "Hermannstraße",
                  "Frankfurter Allee", "Neuköllnische Allee", "Mehringdamm", "Nollendorfplatz", "Bergmannstraße",
                  "Yorckstraße", "Oderberger Straße", "Graefestraße", "Reichenberger Straße", "Schlesische Straße",
                  "Kopenhagener Straße", "Boxhagener Straße", "Weserstraße", "Flughafenstraße", "Turmstraße"]

30.times do
  street = sample_address.sample
  number = rand(1..70)
  full_address = "#{street} #{number}, Berlin"

  new_user = User.create(
    full_name: first_names.sample,
    nickname: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    address: full_address,
    email: Faker::Internet.unique.email,
    password: "123456"
  )
  new_user.profile_picture.attach(
    io: URI.open("https://kitt.lewagon.com/placeholder/users/random"),
    filename: "profile_picture_#{new_user.first_name}.jpeg",
    content_type: "image/jpg"
  )
  new_user.save
  p new_user.first_name
end

instruments = ["guitar", "piano", "violin", "trumpet", "saxophone", "drums", "cello", "flute", "bass guitar", "ukulele",
               "clarinet", "harmonica", "accordion", "trombone", "banjo", "mandolin", "harmonium", "xylophone",
               "marimba", "didgeridoo", "bagpipes", "organ", "synthesizer", "harp", "oboe", "bassoon", "French horn",
               "electric guitar", "acoustic guitar", "steel drum", "conga drum", "timpani", "tabla", "dulcimer",
               "sitar", "kazoo", "bongos", "glockenspiel", "chimes", "vibraphone", "pan flute", "baglama", "oud",
               "djembe", "thumb piano", "pandeiro", "tambourine"]

39.times do
  actual_user = User.order("RANDOM()").first
  instrument = instruments.shift
  instrument_image = instrument_images.shift

  new_instrument = Band.create!(
    band_name: instrument.capitalize,
    band_style: "Lease a high-quality #{instrument} today and start playing your favorite tunes! This #{instrument}
                  is super professional and I keep it ready for your use. Whether you're a beginner or an
                  experienced player, this #{instrument} is perfect for your level.",
    price: rand(2.0..20.0).round(2),
    user: actual_user,
    address: actual_user.address,
    photo: instrument_image
  )
  new_instrument.save
  p new_instrument.title
end
