class Joke < ApplicationRecord
  has_many :favorite, dependent: :destroy
  has_many :comment, dependent: :destroy

  validates :e_body, presence: true
  validates :j_body, presence: true
  validates :e_caption, presence: true
  validates :j_caption, presence: true
  validates :e_speak, presence: true
  validates :j_speak, presence: true

  def favorited_by?(user)
    favorite.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Joke.where('e_body LIKE ? OR j_body LIKE ? OR e_caption LIKE ? OR j_caption LIKE ? OR e_speak LIKE ? OR j_speak LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Joke.all
    end
  end
end
