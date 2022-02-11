class User < ApplicationRecord
	attr_accessor :old_password    #поле, которое не заносится в базу данных, нужно для проверки старого пароля при редактировании пользователя
	has_secure_password validations: false         #отключаем чтобы прописать свои валидации

	has_many :questions, dependent: :destroy        # связь один ко многим для привязки вопросов к пользователю
	has_many :answers, dependent: :destroy

	validate :password_presence
	validate :correct_old_password, on: :update        #добавляем проверку на соответствие старому паролю для update
	validates :password, confirmation: true, allow_blank: true, length: {minimum: 8, maximum: 50}
	

	validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true # используем valid_email_2 для проверки формата email
	validates :name, presence: true

	private

	def correct_old_password
		return if BCrypt::Password.new(password_digest_was).is_password?(old_password)  #сравниваем старый и новый пароли

		errors.add :old_password, 'is incorrect'
	end

	def password_presence
		errors.add(:password, :blank) unless password_digest.present?        #добавляем проверку на наличие пароля когда password_digest еще не указан
	end

end
