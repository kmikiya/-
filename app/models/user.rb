class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   attachment :profile_image
   has_many :books, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :comment_favorites, dependent: :destroy
   has_many :book_comments, dependent: :destroy

   has_many :relationships, class_name: "Relationship", foreign_key: :follower_id
   #has_many :followeds, through: :relationships, source: :follower
   has_many :followings, through: :relationships, source: :followed
   has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :followed_id
  # has_many :followers, through: :reverse_of_relationships, source: :followed
   has_many :followers, through: :reverse_of_relationships, source: :follower

     def follow(user_id)
       relationships.create(followed_id: user_id)
     end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def self.search(keyword)
    if search
      User.where(['name LIKE ?', "%#{keyword}%"])
    else
      User.all
    end
  end


   validates :name, presence: true, length: { in: 2..20 }
   validates :introduction, length: { maximum: 50 }

end
