require 'rails_helper'

describe 'Visitor' do
  it 'cannot add an existing category' do
    category_1 = Category.create(title: "asdf")

    visit new_category_path

    new_category = "asdf"

    fill_in :category_title, with: new_category
    click_on("Create Category")

    expect(current_path).to eq(new_category_path)
  end
end
