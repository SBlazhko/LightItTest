class Post < ApplicationRecord

	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy

	validates :text, presence: true

	default_scope {order("created_at DESC")}
end
