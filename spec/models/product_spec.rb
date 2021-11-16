require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'should create a product' do
    @TestProduct = Product.new
    expect(@TestProduct).to be_a Product
  end

  it 'should make a valid product' do
    @TestProduct = Product.new
    @TestCategory = Category.new
    @TestProduct.name = "test"
    @TestProduct.price = 1
    @TestProduct.quantity = 1
    @TestProduct.category = @TestCategory
    expect(@TestProduct).to be_valid
  end

  describe 'Validations' do
    it 'should check if name exists' do
      @TestProduct = Product.new
      @TestCategory = Category.new
      @TestProduct.price = 1
      @TestProduct.quantity = 1
      @TestProduct.category = @TestCategory
      expect(@TestProduct).to_not be_valid
      expect(@TestProduct.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it 'should check if price exists' do
      @TestProduct = Product.new
      @TestCategory = Category.new
      @TestProduct.name = "test"
      @TestProduct.quantity = 1
      @TestProduct.category = @TestCategory
      expect(@TestProduct).to_not be_valid
      expect(@TestProduct.errors.full_messages[0]).to eq("Price cents is not a number")
    end

    it 'should check if quantity exists' do
      @TestProduct = Product.new
      @TestCategory = Category.new
      @TestProduct.name = "test"
      @TestProduct.price = 1
      @TestProduct.category = @TestCategory
      expect(@TestProduct).to_not be_valid
      expect(@TestProduct.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it 'should check if category exists' do
      @TestProduct = Product.new
      @TestProduct.name = "test"
      @TestProduct.price = 1
      @TestProduct.quantity = 1
      expect(@TestProduct).to_not be_valid
      expect(@TestProduct.errors.full_messages[0]).to eq("Category can't be blank")
    end
  end
end