require 'spec_helper'

describe Product do
  subject(:product) { FactoryGirl.create(:product) }

  it { should have_many(:line_items) }
  it { should have_many(:orders).through(:line_items) }

  [:title, :description, :image_url].each do |field|
    it { should validate_presence_of(field) }
  end

  it { should validate_numericality_of(:price) }
  it { should validate_uniqueness_of(:title) }
  it { should ensure_length_of(:title).is_at_least(10).
                with_message(/must be at least 10 characters long/) }
  it { should validate_format_of(:image_url).with(/\.(gif|jpg|png)\z/i) }

  describe 'price' do
    it 'must be greater than or equal to 0.01' do
      product.price = 0
      expect(product).to have(1).error_on(:price)
    end

    it 'must be greater than or equal to 0.01' do
      product.price = 1
      expect(product).to be_valid
    end
  end

  describe '#ensure_not_referenced_by_any_line_item' do
    it 'should allow to destroy a product if no line_items' do
      product.line_items = []
      expect { product.destroy }.to change(Product, :count).by(-1)
    end

    it 'should not allow to destroy a product if any line_items' do
      product.line_items << FactoryGirl.build(:line_item, product: product)
      expect { product.destroy }.to change(Product, :count).by(0)
    end
  end
end
