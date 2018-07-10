require 'rails_helper'

describe 'visitor' do
  it 'can destroy a job' do
    company = Company.create(name: "Turing")
    job_1 = company.jobs.create(title: 'Dev',
                       description: 'something',
                       level_of_interest: 5,
                       city: "Moscow")
    job_2 = company.jobs.create(title: 'Janitor',
                       description: 'something',
                       level_of_interest: 5,
                       city: "Chechnya")
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
