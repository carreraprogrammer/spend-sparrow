class Budget < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, presence: true
  validates :amount, presence: true
  validates :category, presence: true
end
