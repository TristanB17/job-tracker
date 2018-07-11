require 'rails_helper'

describe 'visitor' do
  it 'can view a job' do
    company = Company.create(name: "Turing")
    category = Category.create(title: "asdf")
    job_1 = company.jobs.create(title: 'Dev',
                       description: 'something',
                       level_of_interest: 5,
                       category_id: category.id,
                       city: "Moscow")
    visit job_path(job_1)
    expect(page).to have_content(job_1.title)
  end
end
