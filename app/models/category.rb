class Category < ApplicationRecord
  belongs_to :user
  has_many :budgets
  validates :icon, presence: true
  validates :name, presence: true
  validates :user, presence: true

  ICONS = {
    'icon1' => 'https://cdn-icons-gif.flaticon.com/6569/6569144.gif',
    'icon2' => 'https://cdn-icons-gif.flaticon.com/6172/6172512.gif',
    'icon3' => 'https://cdn-icons-gif.flaticon.com/6172/6172531.gif',
    'icon4' => 'https://cdn-icons-gif.flaticon.com/6172/6172532.gif',
    'icon5' => 'https://cdn-icons-gif.flaticon.com/6172/6172541.gif',
    'icon6' => 'https://cdn-icons-gif.flaticon.com/6172/6172513.gif',
    'icon7' => 'https://cdn-icons-gif.flaticon.com/6416/6416392.gif',
    'icon8' => 'https://cdn-icons-gif.flaticon.com/6416/6416336.gif',
    'icon9' => 'https://cdn-icons-gif.flaticon.com/7211/7211797.gif',
    'icon10' => 'https://cdn-icons-gif.flaticon.com/6172/6172515.gif',
    'icon11' => 'https://cdn-icons-gif.flaticon.com/6172/6172516.gif',
    'icon12' => 'https://cdn-icons-gif.flaticon.com/6172/6172517.gif',
    'icon13' => 'https://cdn-icons-gif.flaticon.com/6454/6454239.gif',
    'icon14' => 'https://cdn-icons-gif.flaticon.com/6454/6454106.gif',
    'icon15' => 'https://cdn-icons-gif.flaticon.com/6416/6416391.gif',
    'icon16' => 'https://cdn-icons-gif.flaticon.com/7742/7742970.gif',
    'icon17' => 'https://cdn-icons-gif.flaticon.com/9583/9583340.gif'
  }.freeze

  def date
    created_at.strftime('%d %b %Y')
  end

  def total
    budgets.sum(:amount)
  end
end
