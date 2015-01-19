class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interests, dependent: :destroy
  has_many :books, through: :interests
  has_many :comments, dependent: :destroy

  extend Enumerize
  enumerize :role, in: [:user, :admin], default: :user

  def short_name
    "#{self.first_name.try(:first)}. #{self.last_name}"
  end

  def full_name
    [self.first_name, self.last_name].join(' ')
  end

  def librarian_level
    1 + (self.books.count / 3).to_i
  end

  def reader_level
    1 + (self.interests.count / 3).to_i
  end

  def commentator_level
    1 + (self.comments.count / 3).to_i
  end

  def achievements
    all = [
      {:icon => "tree-conifer",   :name => "Розовый слон",      :l => 1, :r => 1, :c => 1},
      {:icon => "tree-deciduous", :name => "Синий жираф",       :l => 1, :r => 1, :c => 2},
      {:icon => "tower",          :name => "Оранжевый кит",     :l => 1, :r => 2, :c => 1},
      {:icon => "globe",          :name => "Серый конь",        :l => 2, :r => 1, :c => 1},
      {:icon => "wrench",         :name => "Фиолетовый бизон",  :l => 2, :r => 2, :c => 1},
      {:icon => "bell",           :name => "Голубой дельфин",   :l => 2, :r => 1, :c => 2},
      {:icon => "magnet",         :name => "Белый бегемот",     :l => 2, :r => 2, :c => 2},
      {:icon => "plane",          :name => "Сиреневая колибри", :l => 2, :r => 2, :c => 4},
      {:icon => "leaf",           :name => "Зеленая кэльпи",    :l => 2, :r => 4, :c => 2},
      {:icon => "tint",           :name => "Красная зебра",     :l => 4, :r => 2, :c => 2},
      {:icon => "picture",        :name => "Желтый дикообраз",  :l => 4, :r => 4, :c => 2},
      {:icon => "camera",         :name => "Гранатовый лев",    :l => 4, :r => 2, :c => 4},
      {:icon => "lock",           :name => "Бирюзовый манул",   :l => 2, :r => 4, :c => 4},
      {:icon => "book",           :name => "Черный дракон",     :l => 4, :r => 4, :c => 4},
    ]
    l = self.librarian_level
    r = self.reader_level
    c = self.commentator_level
    all.select { |a| a[:l] <= l && a[:r] <= r && a[:c] <= c}
  end
end
