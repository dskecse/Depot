require 'spec_helper'

describe Product do
  let(:product) { FactoryGirl.create(:product) }

  it 'is valid with valid attributes' do
    product.should be_valid
  end

  describe '.title' do
    it 'is required' do
      product.title = nil
      product.should have(2).error_on(:title)
    end

    it 'is unique' do
      another_product = FactoryGirl.build(:product, title: product.title)
      another_product.should have(1).error_on(:title)
    end

    it 'must be at least 10 characters long' do
      product.title = 'This is an acceptable title'
      product.should be_valid
    end

    it 'must be at least 10 characters long' do
      product.title = 'So is this'
      product.should be_valid
    end

    it 'must be at least 10 characters long' do
      product.title = 'Not this'
      product.should have(1).error_on(:title)
    end
  end

  describe '.description' do
    it 'is required' do
      product.description = nil
      product.should have(1).error_on(:description)
    end
  end

  describe '.image_url' do
    it 'is required' do
      product.image_url = nil
      product.should have(1).error_on(:image_url)
    end

    it 'must be a url for gif, jpg or png image' do
      %w(fred.gif fred.jpg fred.png FRED.GIF FRED.Jpg http://a.b.c/x/y/z/fred.gif).each do |image|
        FactoryGirl.build(:product, image_url: image).should be_valid
      end
    end

    it 'must be a url for gif, jpg or png image' do
      %w(fred.doc fred.gif/more fred.gif.more).each do |image|
        FactoryGirl.build(:product, image_url: image).should have(1).error_on(:image_url)
      end
    end
  end

  describe '.price' do
    it 'is required' do
      product.price = nil
      product.should have(1).error_on(:price)
    end

    it 'must be a number' do
      product.price = 'NN'
      product.should have(1).error_on(:price)
    end

    it 'must be positive' do
      product.price = -1
      product.should have(1).error_on(:price)
    end

    it 'must be greater than or equal to 0.01' do
      product.price = 0
      product.should have(1).error_on(:price)
    end

    it 'must be greater than or equal to 0.01' do
      product.price = 1
      product.should be_valid
    end
  end
end
