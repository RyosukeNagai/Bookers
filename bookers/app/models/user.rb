class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :post_comments, dependent: :destroy

has_many :books, dependent: :destroy
attachment :profile_image

validates :name,    length: { maximum: 20, minimum: 2}
validates :name,{presence: true}
validates :introduction, length: { maximum: 50 }

end
