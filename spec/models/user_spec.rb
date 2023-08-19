require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'John Doe',
                        email: 'john@example.com',
                        password: 'password')
  end

  it 'Is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'Is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
