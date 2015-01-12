class Interest < ActiveRecord::Base

  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true

  default_scope -> { order('created_at DESC') }

end
