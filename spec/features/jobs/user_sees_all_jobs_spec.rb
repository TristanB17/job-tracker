require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
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
                       city: "Moscow")

    visit company_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
  end
end
