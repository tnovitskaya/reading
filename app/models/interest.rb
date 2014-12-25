class Interest < ActiveRecord::Base

  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy

end
