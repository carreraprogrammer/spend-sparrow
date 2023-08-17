require 'rails_helper'

RSpec.describe Budget, type: :model do
  let(:user) { User.new(name: "John Doe", email: "example@email.com", password: "password")}

  before do
    user.skip_confirmation!
    user.save!
  end

  let(:category) { Category.create!(icon: "https://cdn-icons-png.flaticon.com/128/4342/4342728.png", name: "Food", user: user)}
  subject { described_class.new(name: "Restaurant", amount: 200, user: user, category: category) }

  it 'Is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'Is not valid without a category_id' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end
end