require 'rails_helper'

describe 'a user' do
  it 'sees all jobs by level of interest' do
    company = Company.create(name: 'WHELP!')
    category = Category.create(title: 'Namekian')
    job_1 = Job.create!(title: 'Developer',
                       description: 'something',
                       level_of_interest: 5,
                       company_id: company.id,
                       category_id: category.id,
                       city: "Moscow")
    job_2 = Job.create!(title: 'Another Dev',
                       description: 'something',
                       level_of_interest: 5,
                       company_id: company.id,
                       category_id: category.id,
                       city: "Moscow")
    job_3 = Job.create!(title: 'Ombudsman',
                       description: 'something else',
                       level_of_interest: 4,
                       company_id: company.id,
                       category_id: category.id,
                       city: "Moscow")
    job_4 = Job.create!(title: 'Sven',
                       description: 'Sweden',
                       level_of_interest: 4,
                       company_id: company.id,
                       category_id: category.id,
                       city: "Moscow")
    job_5 = Job.create!(title: 'Another Pev',
                       description: 'something',
                       level_of_interest: 3,
                       company_id: company.id,
                       category_id: category.id,
                       city: "Moscow")
    expected_one = "3: 1"
    expected_two = "4: 2"
    expected_three = "5: 2"

    visit dashboard_path

    expect(page).to have_content(expected_one)
    expect(page).to have_content(expected_two)
    expect(page).to have_content(expected_three)
  end
end
