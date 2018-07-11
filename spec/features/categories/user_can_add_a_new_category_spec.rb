require 'rails_helper'

describe 'Visitor' do
  it 'can create a new category' do
    visit new_category_path

    new_category = "Development"

    fill_in :category_title, with: new_category
    click_on("Create Category")

    expect(current_path).to eq(category_path("#{Category.last.id}"))
    expect(page).to have_content("#{Category.last.title}")
  end
end
