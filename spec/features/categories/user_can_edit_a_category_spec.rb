require 'rails_helper'

describe 'Visitor' do
  it 'can navigate to the edit page from index' do
    category_1 = Category.create(title: "blah")

    visit categories_path

    click_on("Edit")

    expect(current_path).to eq(edit_category_path(category_1))
  end

  it 'can edit the category from the edit page' do
    category_1 = Category.create(title: "blah")
    category_1 = Category.create(title: "asdfasdf")

    visit edit_category_path(category_1)
    expected = "OMG"

    fill_in :category_title, with: expected
    click_on("Update Category")

    expect(current_path).to eq(categories_path)
    expect(page).to have_content(expected)
  end
end
