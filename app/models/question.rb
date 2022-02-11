class Question < ApplicationRecord
	has_many :answers, dependent: :destroy  #удаление всех ответов этого вопроса
	belongs_to :user

	validates :title, presence:true, length: {minimum: 2}
	validates :body, presence: true, length: {minimum: 2}


	def fromated_created_at
		created_at.strftime('%Y-%m-%d %H:%M:%S')
	end
end
