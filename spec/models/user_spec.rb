require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create a user' do
    @TestUser = User.new
    expect(@TestUser).to be_a User
  end

  it 'should create a valid user' do
    @TestUser = User.new
    @TestUser.email = "123@gmail.com"
    @TestUser.password = "123"
    @TestUser.name = "bob"
    expect(@TestUser).to be_valid
  end

  describe 'Validations' do
    it 'should check if name exists' do
      @TestUser = User.new
      @TestUser.email = "123@gmail.com"
      @TestUser.password = "123"
      expect(@TestUser).to_not be_valid
      expect(@TestUser.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it 'should check if password exists' do
      @TestUser = User.new
      @TestUser.email = "123@gmail.com"
      @TestUser.name = "bob"
      expect(@TestUser).to_not be_valid
      expect(@TestUser.errors.full_messages[0]).to eq("Password can't be blank")
    end

    it 'should check if email exists' do
      @TestUser = User.new
      @TestUser.name = "bob"
      @TestUser.password = "123"
      expect(@TestUser).to_not be_valid
      expect(@TestUser.errors.full_messages[0]).to eq("Email can't be blank")
    end

    it 'should check if password meets the length requiremenet' do
      @TestUser = User.new
      @TestUser.email = "123@gmail.com"
      @TestUser.name = "bob"
      @TestUser.password = "1"
      expect(@TestUser).to_not be_valid
      expect(@TestUser.errors.full_messages[0]).to eq("Password is too short (minimum is 3 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate' do
      @TestUser = User.new
      @TestUser.email = "123@gmail.com"
      @TestUser.password = "123"
      @TestUser.name = "bob"

      @TestUser.save

      user = User.authenticate_with_credentials("123@gmail.com","123")
      expect(user).to_not eq(nil)
    end

    it 'should authenticate with spaces in email' do
      @TestUser = User.new
      @TestUser.email = "123@gmail.com"
      @TestUser.password = "123"
      @TestUser.name = "bob"

      @TestUser.save

      user = User.authenticate_with_credentials("   123@gmail.com        ","123")
      expect(user).to_not eq(nil)
    end
  
    it 'should authenticate with capitals in email' do
      @TestUser = User.new
      @TestUser.email = "123@gmail.com"
      @TestUser.password = "123"
      @TestUser.name = "bob"

      @TestUser.save

      user = User.authenticate_with_credentials("123@GMAIL.COM","123")
      expect(user).to_not eq(nil)
    end
  end
end
