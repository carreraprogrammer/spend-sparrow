class Category < ApplicationRecord
  belongs_to :user
  has_many :budgets

  def date
    self.created_at.strftime("%d %b %Y")
  end

  def total
    self.budgets.sum(:amount)
  end
end
