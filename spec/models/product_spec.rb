require 'rails_helper'

RSpec.describe Product, type: :model do
	describe 'Validations' do
		it 'should have 4 validations' do
			@category = Category.create(name: 'France')
			@product = Product.create(name: 'Cologne', price: 1234, quantity: 12, category_id: @category.id)
			expect(@product.name).to eq('Cologne')
			expect(@product.price).to eq(1234)
			expect(@product.quantity).to eq(12)
			expect(@product.category_id).to eq(@category.id)
		end

		it 'should have a name' do
			@category = Category.create(name: 'France')
			@product = Product.create(name: nil, price: 1234, quantity: 12, category_id: @category.id)
			expect(@product.name).to eq(nil)
			expect(@product.errors.full_messages)
		end

		it 'should have a price' do
			@category = Category.create(name: 'France')
			@product = Product.create(name: 'Cologne', price: nil, quantity: 12, category_id: @category.id)
			expect(@product.price).to eq(nil)
			expect(@product.errors.full_messages)
		end

		it 'should have a quantity' do
			@category = Category.create(name: 'France')
			@product = Product.create(name: 'Cologne', price: 1234, quantity: nil, category_id: @category.id)
			expect(@product.quantity).to eq(nil)
			expect(@product.errors.full_messages)
		end

		it 'should have a category' do
			@category = Category.create(name: 'France')
			@product = Product.create(name: 'Cologne', price: 1234, quantity: 12, category_id: nil)
			expect(@product.category_id).to eq(nil)
			expect(@product.errors.full_messages)
		end

	# it { is_expected.to validate_presence_of(:name)}
	# it { is_expected.to validate_presence_of(:price)}
	# it { is_expected.to validate_presence_of(:quantity)}
	# it { is_expected.to validate_presence_of(:category)}
	end
end
