# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"
require "cloudinary"

Skill.destroy_all
Style.destroy_all
UserBandStyle.destroy_all
UserSkill.destroy_all
BandMember.destroy_all
Band.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all

experience = ["Less than 6 months", "Between 6 months to 1 year", "Between 1 to 2 years",
              "Between 2 years to 5 years", "More than 5 years"]
bios = [
  "As a musician, I have spent countless hours honing my craft and developing a sound that blends different genres together, creating a unique style that is truly my own.",
  "When writing lyrics for my songs, I draw inspiration from my own life experiences and struggles, making my music deeply personal and introspective in a way that resonates with listeners.",
  "I take great pride in my live performances, always giving 110% and leaving everything on the stage to create an unforgettable experience for my fans, connecting with them on a personal and emotional level.",
  "With multiple platinum-selling albums and hit singles, I am grateful for the success I've had in the music industry and the opportunity to connect with fans around the world, creating a lasting impact through my music.",
  "Throughout my career, I have strived to evolve my sound and push boundaries with each new release, constantly challenging myself as an artist to innovate and experiment with new styles and sounds.",
  "As a multi-hyphenate artist, I am grateful for the opportunity to explore my creativity in both music and acting, connecting with fans across multiple industries and inspiring them through my art.",
  "My music is a reflection of my deeply held beliefs and values, and I use my platform to address issues of social justice and inequality with a powerful and urgent message, making a meaningful impact on society.",
  "Despite my success, I always remain true to my roots and my vision, never compromising my artistry for the sake of popularity, creating a lasting legacy that transcends time.",
  "My music is deeply personal and often reflects my own struggles and emotions, with a voice that is both haunting and beautiful, creating a powerful and lasting impact on listeners.",
  "I believe that great music is defined by intricate instrumentation and complex arrangements, showcasing the incredible talent and skill of the musician, creating a memorable and impactful experience for listeners.",
  "I am grateful for the opportunity to share my music with the world and to connect with fans in a deep and meaningful way, making a lasting impact on their lives through my art."
]

user_images = [
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830278/ruel-del-jamorol-1Xr5v3kIYIQ-unsplash_htpjw6.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830276/sofie-jarvis-rBMb0vrwCqI-unsplash_fbfhvn.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830275/ryan-ancill-vT8mC3T6faE-unsplash_aakmwc.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830273/vidar-nordli-mathisen-Y8blSqNrxLU-unsplash_fqlyxz.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830270/taylor-vST3iSERj1g-unsplash_dsgdln.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830258/anastacia-dvi-CQ5p_jwA3DI-unsplash_lrs9nf.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830244/matthew-kalapuch-sqJ4tLBiurw-unsplash_jp7mcs.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830248/bobbie-m-bYjfI33nK6Y-unsplash_qfgq54.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830256/muha-ajjan-7hntt9oeebc-unsplash_qpj19c.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830242/kyle-wong-rrHtkX1rLP0-unsplash_1_wc8jhx.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830240/milo-bauman-oih02bWCm3Y-unsplash_sdlagl.jpg"
]


mahboob = User.new(
  full_name: "mahboob",
  nickname: "omary",
  phone: "098876544",
  address: "Magazinstraße 15-16, 10179 Berlin",
  email: "mahboob@gmail.com",
  password: "123456",
  description: bios.sample,
  experience: experience.sample,
  looking_for_band: [true, false].sample
)

mahboob.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667037206/tri21is6dulhoce0cocq.jpg"),
  filename: "profile_picture_mahboob.jpeg",
  content_type: "image/jpg"
)
mahboob.multimedia.attach(
  io: URI.open(user_images.sample),
  filename: "photo.jpeg",
  content_type: "image/jpg"
)

mahboob.save

jane = User.new(
  full_name: "Jane",
  nickname: "Eme",
  phone: "098876544",
  address: "Straßmannstraße 1, 10249 Berlin",
  email: "martins@test.com",
  password: "0123456",
  description: bios.sample,

  experience: experience.sample,
  looking_for_band: [true, false].sample
)
jane.multimedia.attach(
  io: URI.open(user_images.sample),
  filename: "photo#{rand(1..60)}.jpeg",
  content_type: "image/jpg"
)
jane.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667074864/tkaswximthoisj8cucbd.jpg"),
  filename: "profile_picture_jane.jpeg",
  content_type: "image/jpg"
)
jane.save

roger = User.new(
  full_name: "Roger",
  nickname: "Silva",
  phone: "017676490923",
  address: "Goslarer Ufer 3, 10589 Berlin",
  email: "roger.silva@live.cl",
  password: "123456",
  description: bios.sample,
  experience: experience.sample,
  looking_for_band: [true, false].sample
)

roger.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1678216566/dp1l8wttyzcs2ynmpbqf.jpg"),
  filename: "profile_picture_roger.jpeg",
  content_type: "image/jpg"
)
roger.multimedia.attach(
  io: URI.open(user_images.sample),
  filename: "photo#{rand(1..60)}.jpeg",
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

10.times do
  street = sample_address.sample
  number = rand(1..100)
  full_address = "#{street} #{number}, Berlin"

  new_user = User.new(
    full_name: first_names.sample,
    nickname: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    address: full_address,
    email: Faker::Internet.unique.email,
    password: "123456",
    description: bios.sample,
    experience: experience.sample,
    looking_for_band: [true, false].sample
  )
  new_user.profile_picture.attach(
    io: URI.open("https://kitt.lewagon.com/placeholder/users/random"),
    filename: "profile_picture#{rand(1..60)}.jpeg",
    content_type: "image/jpg"
  )
  new_user.multimedia.attach(
    io: URI.open(user_images.sample),
    filename: "photo#{rand(1..60)}.jpeg",
    content_type: "image/jpg"
  )
  new_user.save
  p new_user.full_name
end

bands_name = ["Gurr", "Mia", "Slow Steve", "Jahcoozi", "Seeed", "Beatsteaks", "Jennifer Rostock", "Super700", "Evvol", "Rammstein"]
band_images =
          ["https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816079/1_ravzdf.png",
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816104/2_buulla.png",
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816104/3_dfdw1v.png",
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816174/4_mgjqct.png",
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816073/5_ghppgs.png",
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816247/6_yucugn.png",
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816232/8_mga8zi.png",
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816184/9_uhhb0z.png",
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816137/10_z6n7cs.png",
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816311/12_gmmk53.png"
            ]

cities = ["Berlin", "Hamburg", "Munchen", "Bon", "Leipzig", "Dresden", "Gelsenkirchen"]
descriptions = [
    "Gurr is Berlins beloved by hipsters, all-girl band that is making waves across the city and abroad. The duo Andreya Casablanca and Laura Lee Jenkins formed their band after meeting in their American studies class in Berlin. They then spent some time in the US to soak up West Coast culture, coining the term for their own genre, First Wave Gurrlcore. Their debut album, In My Head was recorded in the city at Funkhaus, which was once an East German radio studio.",
    "Mia is one of Germanys brightest new-age/pop/rock/indie band from Berlin. Formed in 1997, the group has found considerable success on their home turf and across the globe. With an edgy sound and grounded roots in the city, Mia is an energetic band from Germanys capital.",
    "Slow Steve is the Berlin-based, smooth sounding synth-pop band that is charming its horde of followers. With a mellow, indie pop tone and analogue synth, Slow Steve is the ever-so-cool group who are signed to influential Berlin indie label Morr Music.",
    "Jahcoozi is a multicultural Berlin-based trio, offering up a fresh sound that shies away from the mainstream. Fronted by London-born Sasha Perera and backed by producers/multi-instrumentalists, Teuton Robot Koch and Oren Gerlitz, together they put on energetic performances and electric nights at some of the citys wildest clubs and bars. Their pop-electro sound and body-shaking songs are impossible not to dance to or love.",
    "Seeed is a beloved eleven-person Berlin band. Known for their catchy contemporary fusion of German hip-hop, reggae and dancehall styles, this large band formed in 1998 and has found huge success in Germany and the surrounding countries. With a funky, unique sound, theyre a well-established Berlin band thats worth checking out.",
    "Beatsteaks have been around since the mid-90s, blasting alternative German rock from Berlin. Playing alongside German punk legends Die Ärzte and Die Toten Hosen brought the band a wider audience. Theyre still rocking on today, touring and putting on huge shows for adoring and wild fans.",
    "Jennifer Rostock is fronted by German-born singer and TV-host Jennifer Weist. Drawing on elements of hard rock, urban electronics and new-metal, the band produces a rocking, heavy and grunge sound with a female-driven point of view.",
    "Super700 are a less well-known but amazing rock band from Berlin. Formed in 2003 by Ramadani and Michael Have, they have toured across Europe, and in Canada, Asia and America, bringing their English-sung rock hits across the globe.",
    "Evvol is a darkwave electronic duo, comprised of Irish singer Julie Chance and Australian instrumentalist Jane Arnison. Currently based in Kreuzberg, they have stunned at their live shows and festivals appearances around the city. The band creates a unique sound under their prominent theme of the human condition.",
    "Rammstein is Berlins most iconic and influential German rock band. Forming in 1994, they helped found a subgenre of German hard rock and metal that became known as Neue Deutsche Härte. Their influential style and German-centric songs are an insight into Berlins early rock scene and the evolving styles that came out of the city."
]
10.times do
  actual_user = User.all.sample
  new_band = Band.new(
    band_name: bands_name.shift,
    user: actual_user,
    city: cities.sample,
    experience: experience.sample,
    content: descriptions.shift,
    looking_for_member: [true, false].sample
  )
  new_band.multimedia.attach(
    io: URI.open(band_images.shift),
    filename: "#{rand(50..90)}photo.jpeg",
    content_type: "image/jpg"
  )
  new_band.save
  p new_band.band_name
end

# Creating the styles, skills and their associations tables in their databases

styles_list = ["Acoustic", "Alternative", "Blues", "Country", "Electronic", "Experimental", "Folk", "Funk", "Hip-hop",
  "Indie", "Jazz", "Latin", "Metal", "Pop", "Progressive", "Punk", "R&B", "Reggae", "Rock"]

styles_list.each do |i|
  s = Style.new(style: i)
  s.save
end

skills_list = ["Bass", "Bass Guitar", "Drums", "Electric Guitar", "Guitar", "Keyboard", "Lead Guitar", "Lead Vocals",
              "Percussion", "Piano", "Rhythm Guitar", "Saxophone", "Singer", "Songwriter", "Synthesizer", "Trumpet",
              "Turntables", "Vocalist", "Violin"]

skills_list.each do |skill|
  s = Skill.new(skill: skill)
  s.save
end

users = User.all
bands = Band.all
skills = Skill.all
styles = Style.all

15.times do
  # Creating the UserBandStyle table for bands
  UserBandStyle.create(
    band: bands.sample,
    style: styles.sample
  )
end

15.times do
  # Creating the UserBandStyle table for users
  UserBandStyle.create(
    user: users.sample,
    style: styles.sample
  )
end

15.times do
   # Creating the UserSkill table for users
   UserSkill.create(
    user: users.sample,
    skill: skills.sample
  )
end

# User.all.each do |user|
#   number = rand(2..5)
#   sample = User.all.sample(number)
#   sample.each do BandMember.create(
#     user: user_,
#   )
# end
