require 'rails_helper'

describe 'visitor' do
  it 'can destroy a job' do
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

    visit company_jobs_path(company)
    # save_and_open_page

    flash_message = "Job successfully deleted"

    within("#job-#{job_1.id}") do
      click_on("Delete")
    end
    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content(flash_message)
    expect(page).to_not have_content(job_1.title)
  end
end
