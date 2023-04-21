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

# Creating the styles, skills and their associations tables in their databases

styles_list = ["Acoustic", "Alternative", "Blues", "Country", "Electronic", "Experimental", "Folk", "Funk", "Hip-hop",
               "Indie", "Jazz", "Latin", "Metal", "Pop", "Progressive", "Punk", "R&B", "Reggae", "Rock", "Other"]

styles_list.each do |i|
  s = Style.new(style: i)
  s.save
end

skills_list = ["Banjo", "Bass", "Choirs", "Clarinet", "Drums", "Electric Guitar", "Guitar", "Keyboard", "Lead Guitar",
               "Percussion", "Piano", "Saxophone", "Singer", "Songwriter", "Synthesizer", "Trumpet", "Turntables",
               "Vocalist", "Violin", "Other"]

skills_list.each do |e|
  s = Skill.new(skill: e)
  s.save
end

experience = ["Less than 6 months", "Between 6 months to 1 year", "Between 1 to 2 years",
              "Between 2 years to 5 years", "More than 5 years"]
bios = [
  "I have spent countless hours honing my craft and developing a sound that blends different genres together, creating a unique style that is truly my own.",
  "When writing lyrics for my songs, I draw inspiration from my own life experiences and struggles, making my music deeply personal and introspective in a way that resonates with listeners.",
  "I take great pride in my live performances, always giving 110% and leaving everything on the stage to create an unforgettable experience for my fans, connecting with them on a personal and emotional level.",
  "With multiple platinum-selling albums and hit singles, I am grateful for the success I've had in the music industry and the opportunity to connect with fans around the world, creating a lasting impact through my music.",
  "Throughout my career, I have strived to evolve my sound and push boundaries with each new release, constantly challenging myself as an artist to innovate and experiment with new styles and sounds.",
  "As a multi-hyphenate artist, I am grateful for the opportunity to explore my creativity in both music and acting, connecting with fans across multiple industries and inspiring them through my art.",
  "My music is a reflection of my deeply held beliefs and values, and I use my platform to address issues of social justice and inequality with a powerful and urgent message, making a meaningful impact on society.",
  "Despite my success, I always remain true to my roots and my vision, never compromising my artistry for the sake of popularity, creating a lasting legacy that transcends time.",
  "My music is deeply personal and often reflects my own struggles and emotions, with a voice that is both haunting and beautiful, creating a powerful and lasting impact on listeners.",
  "Great music is defined by intricate instrumentation and complex arrangements, showcasing the incredible talent and skill of the musician, creating a memorable and impactful experience for listeners.",
  "I am grateful for the opportunity to share my music with the world and to connect with fans in a deep and meaningful way, making a lasting impact on their lives through my art.",
  "Growing up in a family of musicians, I knew from an early age that music was my true calling. With each passing year, I have continued to refine my skills and push the boundaries of what is possible, constantly experimenting with new sounds and styles.",
  "My greatest strength lies in my ability to connect with people through my music. Whether it's through a powerful live performance or a heartfelt recording, I strive to create an emotional connection with my audience that transcends language and culture.",
  "Inspired by a wide range of musical genres, I have spent years developing a unique sound that combines elements of jazz, funk, and soul. With each new project, I aim to push the boundaries of what is possible and explore new sonic territory.",
  "I believe that the most important thing is to stay true to your artistic vision, no matter what. Whether you're creating music for yourself or for others, it's essential to follow your passion and let your creativity flow.",
  "With a deep passion for music and a commitment to constant improvement, I have dedicated my life to honing my craft and perfecting my sound. Whether I'm playing in a small club or on a big stage, my goal is always the same: to connect with my audience and create an unforgettable musical experience.",
  "As a musician, every performance is an opportunity to create something special and unique. Whether I'm playing with a band or as a solo artist, I strive to bring my own personal touch to each and every performance, always pushing myself to be the best I can be.",
  "With a love of music that runs deep in my veins, I have spent countless hours perfecting my craft and developing a style that is uniquely my own. From humble beginnings to big stages, I have never lost sight of my passion for creating beautiful, soulful music.",
  "I am always searching for new ways to express myself and connect with my audience. Whether it's through a beautiful melody or a raw, emotional performance, I strive to create music that moves people and leaves a lasting impression.",
  "With a sound that blends elements of rock, blues, and folk, I have spent years developing a style that is both original and deeply personal. Through my music, I aim to tell stories that resonate with listeners and inspire them to see the world in new and different ways.",
  "For me music has the power to change lives and bring people together. Whether I'm performing on a big stage or in a small club, my goal is always to create an unforgettable musical experience that leaves a lasting impression on my audience.",
  "I've been playing music since I was a kid, and it's been a wild ride ever since. From garage bands to sold-out shows, I've experienced it all. I'm constantly inspired by the world around me, and my music reflects that.",
  "Music has always been my escape, my way of expressing emotions that I couldn't put into words. My style is raw and authentic, and I hope it resonates with others who feel the same way.",
  "Music has the power to heal, to bring people together, and to change the world. I pour my heart and soul into every performance, and I hope to make a positive impact through my music.",
  "My music is all about pushing boundaries and breaking stereotypes. I love to mix different genres and experiment with new sounds. My goal is to create music that is both innovative and inclusive, that speaks to people from all walks of life."
]

user_images = [
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830273/vidar-nordli-mathisen-Y8blSqNrxLU-unsplash_fqlyxz.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830270/taylor-vST3iSERj1g-unsplash_dsgdln.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830244/matthew-kalapuch-sqJ4tLBiurw-unsplash_jp7mcs.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830248/bobbie-m-bYjfI33nK6Y-unsplash_qfgq54.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830256/muha-ajjan-7hntt9oeebc-unsplash_qpj19c.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830242/kyle-wong-rrHtkX1rLP0-unsplash_1_wc8jhx.jpg",
  "https://res.cloudinary.com/dvrfyi1tt/image/upload/v1680830240/milo-bauman-oih02bWCm3Y-unsplash_sdlagl.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026455/alberto-bigoni-AAnoZVR6vm8-unsplash_kahyhp.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026455/courtney-kenady-tymnoQQIPMA-unsplash_euhj6k.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026455/danny-feng-O2S_Xfdzgho-unsplash_rrzkuu.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026455/sam-moghadam-khamseh-0wFVLpANoYc-unsplash_mbn1qm.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026455/lindsey-bahia-Jw2f-zIiQ9s-unsplash_jewf09.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026455/austin-loveing-0cAbf4Q3OjA-unsplash_tietms.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026455/sam-moghadam-khamseh-ugaOk9LkmQY-unsplash_sl2mks.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026454/austin-wade-YZpuFugdy8Q-unsplash_fued7e.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026454/matheus-ferrero-RxpqZBBevKg-unsplash_e27bwu.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026454/dan-senior-RuxSWSdT99w-unsplash_wcbk66.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026454/karsten-winegeart-DVUEGqLDAN0-unsplash_y2fude.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026454/marco-mons-DIXT8Z9p-Sg-unsplash_k3q4xb.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682026454/soundtrap-5Wj_tk8_Ens-unsplash_ehcgi7.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682027971/sam-moghadam-khamseh-9sfPj0QzOEU-unsplash_ajhhrf.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682027972/sam-moghadam-khamseh-IOo8pnaE8Po-unsplash_fu7cqv.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682027972/natalie-parham-fPKqpUbTL4Y-unsplash_ek9vkh.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682027972/alberto-bigoni-VD94EDo8zvM-unsplash_boczo7.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682027972/chris-ainsworth-7WfcHibcR3Y-unsplash_nzfyea.jpg",
  "https://res.cloudinary.com/la-musique-store/image/upload/v1682027972/peter-okwara-jN1C1V2W2fw-unsplash_ywibb9.jpg"
]

mahboob = User.new(
  full_name: "Mahboob Omary",
  nickname: "_Mahboob_",
  phone: "098876544",
  address: "Magazinstraße 15-16, 10179 Berlin",
  email: "mahboob@gmail.com",
  password: "123456",
  description: bios.shift,
  experience: experience.sample,
  looking_for_band: true
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
mahboob.skills << Skill.all.sample(rand(1..2)).uniq
mahboob.styles << Style.all.sample(rand(1..2)).uniq

jane = User.new(
  full_name: "Jane Eme",
  nickname: "JEM",
  phone: "098876544",
  address: "Straßmannstraße 1, 10249 Berlin",
  email: "martins@test.com",
  password: "0123456",
  description: bios.shift,
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
jane.skills << Skill.all.sample(rand(1..2)).uniq
jane.styles << Style.all.sample(rand(1..2)).uniq

roger = User.new(
  full_name: "Roger Silva",
  nickname: "Dj Bobo",
  phone: "017676490923",
  address: "Goslarer Ufer 3, 10589 Berlin",
  email: "roger.silva@live.cl",
  password: "123456",
  description: "Hey everyone! I'm Roger, or DJ Bobo, newbie in Berlin and I'm looking to join some bands and meet other musicians who share my passion for music. I love all kinds of music, from rock to jazz to blues. I'm looking for people who are serious about making music, but also love to have fun and jam out.",
  experience: experience.sample,
  looking_for_band: true
)

roger.profile_picture.attach(
  io: URI.open("https://res.cloudinary.com/la-musique-store/image/upload/v1682033069/L1005931_low-q_auaaqm.jpg"),
  filename: "profile_picture_roger.jpeg",
  content_type: "image/jpg"
)
roger.multimedia.attach(
  io: URI.open(user_images.sample),
  filename: "photo#{rand(1..60)}.jpeg",
  content_type: "image/jpg"
)

roger.save
roger.skills << Skill.all.sample(rand(1..3)).uniq
roger.styles << Style.all.sample(rand(1..3)).uniq

fullnames = ["Taylor Carter", "Jordan Patel", "Alexis Reynolds", "Cameron Mitchell", "Morgan Lee", "Casey Liu",
             "Avery Garcia", "Jamie Kim", "Dakota Singh", "Logan Baker", "Payton White", "Tyler Nguyen",
             "Reese Chang", "Darian Cooper", "Kendall Wong", "Riley Davis", "Jordan Park", "Hayden Patel",
             "Dakota Chen", "Avery Salazar", "Shay Lee", "Spencer Rodriguez", "Emerson Tran", "Sidney Thomas",
             "Corey Kim", "Bailey Rodriguez", "Jesse Chen", "Ashton Chen", "Sage Green", "Morgan Kim",
             "Emery Williams", "Quinn Chen", "Drew Thompson", "Jules Lee", "Frankie Kim", "Taylor Lee",
             "Parker Hernandez", "Remy Lee", "Harley Wong", "Skyler Lee"]

nicknames = ["DJ Spatula", "Bass Face", "The Rhythmic Avocado", "MC Squid", "Captain Kazoo", "Sir Dance-a-Lot",
             "The Guitar Ninja", "DJ Waffle Cone", "The Funky Ferret", "The Banjo Bandit", "DJ Tofu",
             "The Beat Burrito", "MC Meatball", "The Singing Squirrel", "The Harmonica Hooligan", "DJ Hot Sauce",
             "The Accordion Assassin", "The Saxophone Samurai", "The Keyboard Kid", "MC Meatloaf",
             "The Tambourine Troubadour", "The Maracas Master", "DJ Pickle", "The Ukulele Unicorn",
             "The Flute Fiasco", "The Cowbell Captain", "The Trumpet Titan", "MC Mac and Cheese",
             "The Electric Eggplant", "DJ Pancake", "The Didgeridoo Dynamo", "The Mandolin Magician",
             "The Clapping Cowboy", "The Drumstick Dancer", "MC Muffin", "The Singing Scallion",
             "The Guitar Gladiator", "DJ Gouda", "The Synthesizer Sorcerer", "The Fiddle Frenzy",
             "The Triangle Tornado"]

sample_address = ["Friedrichstraße", "Potsdamer Platz", "Unter den Linden", "Kurfürstendamm", "Alexanderplatz",
                  "Karl-Marx-Straße", "Oranienburger Straße", "Kastanienallee", "Torstraße", "Simon-Dach-Straße",
                  "Schönhauser Allee", "Warschauer Straße", "Kottbusser Tor", "Sonnenallee", "Hermannstraße",
                  "Frankfurter Allee", "Neuköllnische Allee", "Mehringdamm", "Nollendorfplatz", "Bergmannstraße",
                  "Yorckstraße", "Oderberger Straße", "Graefestraße", "Reichenberger Straße", "Schlesische Straße",
                  "Kopenhagener Straße", "Boxhagener Straße", "Weserstraße", "Flughafenstraße", "Turmstraße"]

20.times do
  street = sample_address.sample
  number = rand(1..100)
  full_address = "#{street} #{number}, Berlin"

  new_user = User.new(
    full_name: fullnames.sample,
    nickname: nicknames.sample,
    phone: Faker::PhoneNumber.cell_phone_with_country_code,
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
  new_user.skills << Skill.all.sample(rand(1..2)).uniq
  new_user.styles << Style.all.sample(rand(1..2)).uniq
  p new_user.full_name
end

band_names = ["Arctic Monkeys", "Tame Impala", "Vampire Weekend", "The 1975", "The Strokes", "Radiohead", "Foals",
              "Twenty One Pilots", "Bastille", "Imagine Dragons", "Hozier", "The Black Keys", "Muse", "Coldplay",
              "Red Hot Chili Peppers"]

band_images = ["https://res.cloudinary.com/la-musique-store/image/upload/v1682030907/ArcticMonkeys02DC011211_kt5wkz.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682030907/Tame_Impala_at_Flow_Festival_Helsinki_Aug_10_2019_-24_b7tymt.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682033367/vampire-weekend-debut-album-abcc4ca0-a4df-4c7b-95ca-ad447c4142d2_knynao.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682030907/the-1975-5-orig_3_orig_bvjjmc.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682033452/the-strokes-lizzy-goodman-podcast-54357083-036c-40cf-9262-4d53e5e5f8c4_vku8d2.webp",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682030906/radiohead1277037515_rtnrcw.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682030907/Foals_LEAD_PRESS_SHOT_ALEX_KNOWLES_oysdno.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682030906/twenty_one_pilots_-_main_pub_-_jabari_jacobs_c17n75.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682033519/Bastille_zn0bdh.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682030906/Imagine-Dragons-HEADER_zjwzwy.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682031113/hozier-992x560_x1zx5q.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682031174/The_Black_Keys_KJ-Shop_1_1170x600_1670860257_ovtxor.png",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682030908/muse_biqjjq.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682030908/coldplay-tour_olpd9p.jpg",
               "https://res.cloudinary.com/la-musique-store/image/upload/v1682030908/red-hot-chili-peppers-tour-2023-mannheim-738x415_bqx3qf.jpg"]

cities = ["Mitte, Berlin", "Charlottenburg, Berlin", "Friedrichshain, Berlin", "Lichtenberg, Berlin",
          "Kreuzberg, Berlin", "Neukölln, Berlin", "Pankow, Berlin", "Reinickendorf, Berlin", "Spandau, Berlin",
          "Steglitz, Berlin", "Tempelhof, Berlin", "Treptow, Berlin", "Prenzlauer Berg, Berlin", "Schöneberg, Berlin",
          "Moabit, Berlin"]

descriptions = [
  "We are Arctic Monkeys, an English indie rock band. With our distinctive sound that blends garage rock, punk, and post-punk revival, we've been rocking audiences since 2002. Our energetic and lively performances are sure to get you up and dancing.",
  "Hey there, we're Tame Impala, an Australian psychedelic music project led by Kevin Parker. Our music is known for its dreamy, hypnotic soundscapes that transport you to another world. With our unique blend of retro and modern influences, we create music that is both nostalgic and innovative.",
  "Hi, we're Vampire Weekend, an American indie rock band. Our music is characterized by our use of eclectic musical styles and witty lyrics that often reference literature, film, and other aspects of pop culture. We strive to create music that is both intellectually stimulating and fun to listen to.",
  "What's up, we're The 1975, an English pop rock band. Our music is known for its introspective lyrics that explore themes such as love, anxiety, and addiction. With our catchy hooks and infectious melodies, we create music that is both emotionally resonant and commercially successful.",
  "Hey everyone, we're The Strokes, an American rock band. Our music is characterized by our use of gritty guitar riffs, catchy hooks, and infectious rhythms. With our raw energy and powerful stage presence, we create a live experience that is unforgettable.",
  "Greetings, we're Radiohead, an English rock band. With our unique blend of experimental rock, electronic music, and ambient soundscapes, we've been pushing the boundaries of what's possible in music since the early 90s. Our music is known for its emotional intensity and thought-provoking lyrics.",
  "Hello, we're Foals, an English indie rock band. Our music is characterized by our use of complex rhythms, intricate guitar work, and soaring vocals. With our powerful and dynamic live performances, we create a visceral experience that is both uplifting and cathartic.",
  "Hey there, we're Twenty One Pilots, an American musical duo. Our music is characterized by our eclectic blend of genres, including hip hop, rock, and electronic music. With our emotionally raw lyrics and energetic performances, we strive to create music that connects with our fans on a deep level.",
  "Hi, we're Bastille, an English indie pop band. Our music is characterized by our use of anthemic choruses, catchy hooks, and electronic beats. With our emotive lyrics and powerful vocals, we create music that is both uplifting and introspective.",
  "What's up, we're Imagine Dragons, an American rock band. Our music is characterized by our use of explosive rhythms, soaring melodies, and introspective lyrics. With our powerful and dynamic live performances, we create a sense of collective energy that is truly unforgettable.",
  "Hey everyone, I'm Hozier, an Irish musician. With my soulful voice and heartfelt lyrics, I create music that explores themes such as love, spirituality, and social justice. With my powerful and emotive live performances, I strive to connect with my fans on a deep and meaningful level.",
  "Hey everyone, we are The Black Keys! We make music that blends garage rock, blues, and soul into a sound that's all our own. Our music is all about raw energy and emotion, and we pour our hearts into every note we play. We've been together for over two decades now, and we've traveled all over the world playing our music for anyone who will listen.",
  "Hey, we're Muse! We make epic, grandiose rock music with soaring vocals, intricate guitar work, and bombastic drums. We like to incorporate electronic elements and orchestral arrangements into our sound.",
  "Hi there, we're Coldplay! We've been making music for over 20 years, and we specialize in heartfelt, anthemic pop-rock. Our songs often feature emotional lyrics and lush, atmospheric production.",
  "Yoooooo!, we're the Red Hot Chili Peppers! We've been around since the 80s, and we're known for our funky, punky, alt-rock sound. We like to mix up different genres, and we're not afraid to get a little weird with our music."
]

band_names.each_with_index do |band, index|
  actual_user = User.all.sample
  new_band = Band.new(
    band_name: band,
    user: actual_user,
    city: cities.sample,
    experience: experience.sample,
    content: descriptions[index],
    looking_for_member: [true, false].sample
  )
  new_band.multimedia.attach(
    io: URI.open(band_images[index]),
    filename: "#{band}_image.jpeg",
    content_type: "image/jpg"
  )
  new_band.save
  new_band.styles << Style.all.sample(rand(1..2)).uniq
  p new_band.band_name
end
