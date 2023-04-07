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

Band.destroy_all
User.destroy_all

skills = ["Bass", "Bass Guitar", "Drums", "Electric Guitar", "Guitar", "Keyboard", "Lead Guitar", "Lead Vocals",
          "Percussion", "Piano", "Rhythm Guitar", "Saxophone", "Singer", "Songwriter", "Synthesizer",
          "Trumpet", "Turntables", "Vocalist", "Violin", "Other"]
styles = ["Acoustic", "Alternative", "Blues", "Country", "Electronic", "Experimental", "Folk", "Funk", "Hip-hop",
            "Indie", "Jazz", "Latin", "Metal", "Pop", "Progressive", "Punk", "R&B", "Reggae", "Rock", "Other"]

experience = ["Less than 6 months", "Between 6 months to 1 year", "Between 1 to 2 years",
              "Between 2 years to 5 years", "More than 5 years"]
bios = [
      "As a musician, I have spent countless hours honing my craft and developing a sound that blends different genres together, creating a unique style that is truly my own.",
      "When writing lyrics for my songs, I draw inspiration from my own life experiences and struggles, making my music deeply personal and introspective in a way that resonates with listeners.",
      "I take great pride in my live performances, always giving 110% and leaving everything on the stage to create an unforgettable experience for my fans, connecting with them on a personal and emotional level.",
      "With multiple platinum-selling albums and hit singles, I am grateful for the success I've had in the music industry and the opportunity to connect with fans around the world, creating a lasting impact through my music.",
      "Throughout my career, I have strived to evolve my sound and push boundaries with each new release, constantly challenging myself as an artist to innovate and experiment with new styles and sounds.",
      "As a musician, I believe that the power of music lies in its ability to move and inspire people, and I always strive to connect with my audience on a deep and emotional level, creating a meaningful and lasting impact.",
      "I take great care in crafting infectious beats and catchy hooks that make it impossible for listeners not to dance along to my music, creating a universal appeal that transcends genre and culture.",
      "As a multi-hyphenate artist, I am grateful for the opportunity to explore my creativity in both music and acting, connecting with fans across multiple industries and inspiring them through my art.",
      "My music is a reflection of my deeply held beliefs and values, and I use my platform to address issues of social justice and inequality with a powerful and urgent message, making a meaningful impact on society.",
      "Despite my success, I always remain true to my roots and my vision, never compromising my artistry for the sake of popularity, creating a lasting legacy that transcends time.",
      "As a musician, I strive to create music that transcends genre and time, appealing to fans of all ages and backgrounds, making a universal impact through my art.",
      "I take great pride in my ability to innovate and experiment with new sounds and styles, constantly pushing boundaries to create something truly unique that resonates with listeners on a deep and emotional level.",
      "My music is deeply personal and often reflects my own struggles and emotions, with a voice that is both haunting and beautiful, creating a powerful and lasting impact on listeners.",
      "I believe that great music is defined by intricate instrumentation and complex arrangements, showcasing the incredible talent and skill of the musician, creating a memorable and impactful experience for listeners.",
      "As a musician, I am grateful for the opportunity to share my music with the world and to connect with fans in a deep and meaningful way, making a lasting impact on their lives through my art."
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
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830240/milo-bauman-oih02bWCm3Y-unsplash_sdlagl.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830240/milo-bauman-oih02bWCm3Y-unsplash_sdlagl.jpg"
]


mahboob = User.create!(
  full_name: "mahboob",
  nickname: "omary",
  phone: "098876544",
  address: "Magazinstraße 15-16, 10179 Berlin",
  email: "mahboob@gmail.com",
  password: "123456",
  description: bios.sample,
  skills: skills.sample(3),
  style: styles.sample,
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
  filename: "photo#{rand(1..60)}.jpeg",
  content_type: "image/jpg"
)

mahboob.save

# mahboob_Band = Band.create!(
#   band_name: "Electric",
#   band_style: "Fusion of Electric and dancehall.",
#   # price: rand(2.0..20.0).round(2),
#   user_id: mahboob.id,
#   # address: mahboob.address
# )

# mahboob_Band.photos.attach(
#   io: URI.open("https://dailymusicroll.s3.us-west-2.amazonaws.com/wp-content/uploads/2022/04/21160802/5499313034_11ba8fdcf8_b.jpg"),
#   filename: "photo_rubab1.jpeg",
#   content_type: "image/jpg"
# )
# mahboob.save

# mahboob_Band.photos.attach(
#   io: URI.open("https://i.guim.co.uk/img/media/bdc6551c0615762ef8e523dedfbe72a0daacc722/0_197_1791_1075/master/1791.jpg?width=1200&quality=85&auto=format&fit=max&s=1f7e5f7a7df79bf5936284cc52d2da18"),
#   filename: "photo_rubab2.jpeg",
#   content_type: "image/jpg"
# )
# mahboob.save

# mahboob_Band.photos.attach(
#   io: URI.open("https://i.ytimg.com/vi/RCabnDJ8Tgc/maxresdefault.jpg"),
#   filename: "photo_rubab3.jpeg",
#   content_type: "image/jpg"
# )
# mahboob.save

jane = User.create!(
  full_name: "Jane",
  nickname: "Eme",
  phone: "098876544",
  address: "Straßmannstraße 1, 10249 Berlin",
  email: "martins@test.com",
  password: "0123423453456",
  description: bios.sample,
  skills: skills.sample(3),
  style: styles.sample,
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

# jane_Band = Band.create!(
#   band_name: "Neon skies",
#   band_style: "Fusion of Electric and Blues",
#   user_id: jane.id,
#   # address: jane.address
# )

# jane_Band.photos.attach(
#   io: URI.open("https://www.musicalortiz.com/wp-content/uploads/2021/11/Marimba.jpg"),
#   filename: "photo_marimba.jpeg",
#   content_type: "image/jpg"
# )
# jane.save



roger = User.create(
  full_name: "Roger",
  nickname: "Silva",
  phone: "017676490923",
  address: "Goslarer Ufer 3, 10589 Berlin",
  email: "roger.silva@live.cl",
  password: "1986223456",
  description: bios.sample,
  skills: skills.sample(3),
  style: styles.sample,
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

# roger_Band = Band.create!(
#   band_name: "Whiskey Rebels",
#   band_style: "Fusion of alternative and psychedelic rock.",
#   # price: rand(2.0..20.0).round(2),
#   user_id: roger.id,
#   # address: roger.address
# )
# roger_Band.photos.attach(
#   io: URI.open("https://musiculum.de/wp-content/uploads/2021/02/Charango.jpg"),
#   filename: "photo_charango1.jpeg",
#   content_type: "image/jpg"
# )
# roger.save


bands_name = ["Gurr", "Mia", "Slow Steve", "Jahcoozi", "Seeed", "Beatsteaks", "Jennifer Rostock", "Super700", "Evvol", "Rammstein", "Wir Sind Helden", "Laisse-Moi", "La Musique"]
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
          "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680816233/11_kz7sk5.png",
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
    "Rammstein is Berlins most iconic and influential German rock band. Forming in 1994, they helped found a subgenre of German hard rock and metal that became known as Neue Deutsche Härte. Their influential style and German-centric songs are an insight into Berlins early rock scene and the evolving styles that came out of the city.",
    "Wir Sind Helden, meaning We are Heroes in English, are a German pop-rock band established in Hamburg and based in Berlin. Their pop-rock sound has tones of the New German Wave style, deriving from punk roots but bringing a fresh, new sound. Popular in Berlin and around Germany, Wir Sind Helden shows the countrys love for new rock and thumping songs.",
    "Laisse-Moi, a Berlin-based synth pop trio, was born in a analysts office. As a teenager, Manon Heugel grew up as the “girl singer” in “guys bands,” but got sick of singing the funk rock fashionable in 90s Paris, moved to Berlin, and found work as an actress. But then, in her analysts office, she decided she wanted to sing her own songs. She found a German bassist, Christina Riesenweber, and a classically-trained French pianist, Marie Klock, and with a drum machine and vintage analog synthesizers, they formed a synthpop band inspired by German no-wave and 80s French pop, narrating stories of Berlin nightlife with a sexy, feminist bent.",
    "La Musique is a relatively new musical band that has recently emerged in the vibrant city of Berlin, Germany. Despite being a young band, they have already made a name for themselves by putting on outstanding musical shows that captivate their audience. La Musique is quickly gaining popularity and it is only..."
]
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

  new_user = User.create(
    full_name: first_names.sample,
    nickname: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    address: full_address,
    email: Faker::Internet.unique.email,
    password: "123456",
    description: bios.sample,
    skills: skills.sample(2),
    style: styles.sample,
    experience: experience.sample,
    looking_for_band: [true, false].sample
  )
  new_user.profile_picture.attach(
    io: URI.open("https://kitt.lewagon.com/placeholder/users/random"),
    filename: "profile_picture_#{new_user.full_name}.jpeg",
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

10.times do
  actual_user = User.order("RANDOM()").first
  band_image = band_images.shift

  new_band = Band.create!(
    band_name: bands_name.shift,
    band_style: styles.sample,
    user_id: actual_user.id,
    city: cities.sample,
    experience: experience.sample,
    content: descriptions.shift,
    looking_for_member: [true, false].sample,
    style: styles.sample,
  )
  new_band.multimedia.attach(
    io: URI.open(band_image),
    filename: "photo#{rand(1..60)}.jpeg",
    content_type: "image/jpg"
  )
  new_band.save
  p new_band.band_name
end
