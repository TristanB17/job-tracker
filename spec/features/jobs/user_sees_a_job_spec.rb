require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "asdf")
    job_1 = company.jobs.create(title: 'Developer',
                       description: 'something',
                       level_of_interest: 5,
                       category_id: category.id,
                       city: "Moscow")

    visit company_job_path(company, job_1)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("5")
  end
end
