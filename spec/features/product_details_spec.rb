require 'rails_helper'

RSpec.feature "visitor navigates to ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products and click on product to enter products page" do
    # ACT
    visit root_path

    first('a.btn.btn-default.pull-right').click

    # DEBUG / VERIFY
     save_screenshot

     expect(page).to have_text 'Apparel'
  end
end
