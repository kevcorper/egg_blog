class Post < ActiveRecord::Base
	has_many :comments
	has_many :post_tags
	has_many :tags, through: :post_tags
	belongs_to :author, foreign_key: :author_id, class_name: "User"

	validates :title, presence: true
	validates :body, presence: true
	validates :author_id, presence: true

	def tag_names_string
		array = self.tags.each_with_object([]){ |tag, holder| holder << tag.name }
		array.join(' ')
	end
end
