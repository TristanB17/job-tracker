require 'rails_helper'

describe 'Visitor' do
  it 'can see a page with all jobs by city' do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "asdf")
    job_1 = company.jobs.create(title: 'Developer',
                       description: 'something',
                       level_of_interest: 5,
                       category_id: category.id,
                       city: "Moscow")
    job_2 = company.jobs.create(title: 'Another Dev',
                       description: 'something',
                       level_of_interest: 5,
                       category_id: category.id,
                       city: "Sana'a")

    visit dashboard_path

    click_on("Sana'a")

    # expect(current_path).to eq("/jobs?location=#{job_2.city}")
    expect(page).to_not have_content(job_1.title)
  end
end
