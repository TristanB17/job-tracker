require 'rails_helper'

describe 'Visitor' do
  it 'can view all categories' do
    category_1 = Category.create(title: "a category")
    category_2 = Category.create(title: "another category")
    category_3 = Category.create(title: "the best category")

    visit categories_path

    expect(page).to have_content(category_1.title)
    expect(page).to have_content(category_2.title)
    expect(page).to have_content(category_3.title)
  end
end
