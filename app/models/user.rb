class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :bands
  has_many :band_members
  has_many :chatroom_senders, class_name: "Chatroom", foreign_key: :sender
  has_many :chatroom_receivers, class_name: "Chatroom", foreign_key: :recever
  has_many :user_skills
  has_many :skills, through: :user_skills


  # validates :full_name, presence: true
  # validates :nickname, presence: true

  # validates :nickname, length: { minimum: 4, maximum: 20 }, allow_blank: true

  # validates :description, length: { maximum: 200 }

  validates :email, uniqueness: true
  # validates :nickname, uniqueness: true

  has_one_attached :profile_picture
  has_many_attached :multimedia

  STYLE = ["Acoustic", "Alternative", "Blues", "Country", "Electronic", "Experimental", "Folk", "Funk", "Hip-hop",
           "Indie", "Jazz", "Latin", "Metal", "Pop", "Progressive", "Punk", "R&B", "Reggae", "Rock", "Other"]
  # validates :style, inclusion: { in: STYLE }, allow_blank: true
  # enum style ["Acoustic", "Alternative", "Blues", "Country", "Electronic", "Experimental", "Folk", "Funk", "Hip-hop",
  # "Indie", "Jazz", "Latin", "Metal", "Pop", "Progressive", "Punk", "R&B", "Reggae", "Rock", "Other"]

  EXPERIENCE = ["Less than 6 months", "Between 6 months to 1 year", "Between 1 to 2 years",
                "Between 2 years to 5 years", "More than 5 years"]
  # validates :experience, inclusion: { in: EXPERIENCE }, allow_blank: true

  SKILLS = ["Bass", "Bass Guitar", "Drums", "Electric Guitar", "Guitar", "Keyboard", "Lead Guitar", "Lead Vocals",
            "Percussion", "Piano", "Rhythm Guitar", "Saxophone", "Singer", "Songwriter", "Synthesizer",
            "Trumpet", "Turntables", "Vocalist", "Violin", "Other"]
  # validates :skills, inclusion: { in: SKILLS }, allow_blank: true
end
