require 'rails_helper'

describe 'Visitor' do
  it 'can delete a category from the index page' do
    category_1 = Category.create(title: "a category")
    category_2 = Category.create(title: "another category")
    category_3 = Category.create(title: "the best category")

    visit categories_path

    within("#category_#{category_2.id}") do
      click_on("Delete")
    end

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content(category_2.title)
    expect(page).to have_content(category_1.title)
    expect(page).to have_content(category_3.title)

  end
end
