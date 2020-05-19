class Book < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :post_comments, dependent: :destroy
	validates :body, presence: true, length: { maximum: 200}
    validates :title, {presence: true}
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
end
end