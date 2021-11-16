class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    downcase_squish_email = email.downcase.squish
    user = User.find_by_email(downcase_squish_email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end