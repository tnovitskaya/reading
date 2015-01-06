class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interests, dependent: :destroy
  has_many :books, through: :interests
  has_many :comments, dependent: :destroy

  def short_name
    "#{self.first_name.first}. #{self.last_name}"
  end

end
