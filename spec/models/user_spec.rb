require 'rails_helper'

RSpec.describe User, type: :model do
	context 'Validations' do
		it "it shouldn't save if emails match" do
			@user = User.create(first_name: 'Cologne', last_name: 'Doe', email: 'cologne@doe.com', password: '1234', password_confirmation: '1234')
			@user2 = User.create(first_name: 'Cologne', last_name: 'Doe', email: 'cologne@buck.com', password: '1234', password_confirmation: '1234')
			expect(@user2.email).to be_nil
		end

		it "shouldn't save without password_confirmation" do
			@user = User.create(first_name: 'Cologne', last_name: 'Doe', email: 'cologne@doe.com', password: '1234', password_confirmation: nil)
			@user2 = User.create(first_name: 'Cologne', last_name: 'Doe', email: 'cologne@doe.com', password: '1234', password_confirmation: '1234')
			expect(@user.id).to be_nil
		end

		it "shouldn't save without matching passwords" do
			@user = User.create(first_name: 'Cologne', last_name: 'Doe', email: 'cologne@doe.com', password: '1234', password_confirmation: '4321')
			@user2 = User.create(first_name: 'Cologne', last_name: 'Doe', email: 'cologne@doe.com', password: '1234', password_confirmation: '1234')
			expect(@user.id).to be_nil
			expect(@user2.id).to be_valid
		end

		it "shouldn't save if the password is less than 4 characters" do
			@user = User.create(first_name: 'Cologne', last_name: 'Doe', email: 'cologne@doe.com', password: '123', password_confirmation: '4321')
			@user2 = User.create(first_name: 'Cologne', last_name: 'Doe', email: 'cologne@doe.com', password: '1234', password_confirmation: '1234')
			expect(@user.id).to be_nil
			expect(@user2.id).to be_valid
		end
		it {should have_secure_password}

	end
end
