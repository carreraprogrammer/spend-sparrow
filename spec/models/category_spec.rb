require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.new(name: "John Doe", email: "example@email.com", password: "password")}

  before do
    user.skip_confirmation!
    user.save!
  end

  subject { 
    described_class.create!(icon: "https://cdn-icons-png.flaticon.com/128/4342/4342728.png",
                        name: "Food",
                        user: user)
  }
  
  let(:budget1) { Budget.new(user: user, category: subject, name: "Restaurant", amount: 200) }
  
  let(:budget2) { Budget.new(user: user, category: subject, name: "Groceries", amount: 150) }


  describe "validations" do
    it 'Is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'Is not valid without an icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'Is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Is not valid without a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end

  describe "#total" do
    it 'Returns the total amount of all budgets for the category' do
      budget1.save!
      budget2.save!
      expect(subject.total).to eq(350)
    end
  end

  describe '#date' do
    it 'Returns the formated date' do
      expect(subject.date).to eq(subject.created_at.strftime("%d %b %Y"))
    end
  end
end
