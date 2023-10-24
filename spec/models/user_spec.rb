require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    subject { User.create(name: 'User One', email: 'unique@example.com', password: "123abc", password_confirmation: "123abc") }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive}
    # is it necessary to use ':password_digest' or will 'rails magic' allow validating ':password' ?
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
  end

  describe 'user creation' do
    it 'should not store plain text passwords in password attribute' do
      user = User.create(name: 'Meg', email: 'meg@test.com', password: 'password123', password_confirmation: 'password123')
        expect(user).to_not have_attribute(:password)
        expect(user.password_digest).to_not eq('password123')
    end
  end
end
