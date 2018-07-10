require 'rails_helper'

describe 'visitor' do
  it 'can view the edit page for a single job' do
    company = Company.create(name: "Turing")
    job_1 = company.jobs.create(title: 'Dev',
                       description: 'something',
                       level_of_interest: 5,
                       company_id: 1,
                       city: "Moscow")
    visit edit_job_path(job_1)
    expect(page).to have_content("Edit Job")
  end
end
