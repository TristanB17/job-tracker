require 'rails_helper'

describe 'visitor' do
  it 'can edit a job' do
    company = Company.create(name: "Turing")
    job_1 = company.jobs.create(title: 'Dev',
                       description: 'something',
                       level_of_interest: 5,
                       city: "Moscow")
    visit edit_job_path(job_1)
    new_title = "Plumber"
    fill_in :job_title, with: new_title
    click_on("Update Job")

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content(new_title)
  end
end
