require 'rails_helper'

describe 'Visitor' do
  it 'can view jobs sorted by city' do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "asdf")
    job_1 = company.jobs.create(title: 'Developer',
                       description: 'something',
                       level_of_interest: 5,
                       category_id: category.id,
                       city: "asdf")
    job_2 = company.jobs.create(title: 'Another Dev',
                       description: 'something',
                       level_of_interest: 5,
                       category_id: category.id,
                       city: "Moscow")
    visit '/jobs?sort=location'

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
  end
  it 'can view jobs sorted by interest' do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "asdf")
    job_1 = company.jobs.create(title: 'Developer',
                       description: 'something',
                       level_of_interest: 2,
                       category_id: category.id,
                       city: "asdf")
    job_2 = company.jobs.create(title: 'Another Dev',
                       description: 'something',
                       level_of_interest: 5,
                       category_id: category.id,
                       city: "Moscow")
    visit '/jobs?sort=location'

    expect(page).to have_content(job_2.title)
    expect(page).to have_content(job_1.title)
  end
end
