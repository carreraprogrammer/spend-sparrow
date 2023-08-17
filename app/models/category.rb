class Category < ApplicationRecord
  belongs_to :user
  has_many :budgets
  validates :icon, presence: true
  validates :name, presence: true
  validates :user, presence: true

  ICONS = {
    'icon1' => 'https://cdn-icons-png.flaticon.com/128/4341/4341865.png',
    'icon2' => 'https://cdn-icons-png.flaticon.com/128/4342/4342730.png',
    'icon3' => 'https://cdn-icons-png.flaticon.com/128/4342/4342801.png',
    'icon4' => 'https://cdn-icons-png.flaticon.com/128/4342/4342755.png',
    'icon5' => 'https://cdn-icons-png.flaticon.com/128/4342/4342742.png',
    'icon6' => 'https://cdn-icons-png.flaticon.com/128/4342/4342821.png',
    'icon7' => 'https://cdn-icons-png.flaticon.com/128/4342/4342779.png',
    'icon8' => 'https://cdn-icons-png.flaticon.com/128/4342/4342747.png',
    'icon9' => 'https://cdn-icons-png.flaticon.com/128/4342/4342728.png',
    'icon10' => 'https://cdn-icons-png.flaticon.com/128/4342/4342859.png'
  }

  def date
    self.created_at.strftime("%d %b %Y")
  end

  def total
    self.budgets.sum(:amount)
  end
end
