class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interests, dependent: :destroy
  has_many :books, through: :interests
  has_many :comments, dependent: :destroy

end
