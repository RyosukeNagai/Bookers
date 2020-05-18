class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
validates :name,    length: { maximum: 20, minimum: 2}
validates :name,{presence: true}
has_many :books, dependent: :destroy
end
