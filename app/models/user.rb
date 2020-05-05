class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Authentication
  class << self
    def authenticate(email, password)
      user = User.find_for_authentication(email: email)
      user.try(:valid_password?, password) ? user : nil
    end
  end

  # Validates 
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, confirmation: true
  validates :username, presence: true,
                     uniqueness: true,
                     format: {
                       with: /\A[a-zA-Z0-9_-]+\z/,
                       message: "characters not valid"
                     }
  validates :email, presence: true,
                  uniqueness: true

  # Relations
  belongs_to :role
  has_and_belongs_to_many :warehouse
  
  def fullname
    self.first_name + ' ' + self.last_name
  end
end
