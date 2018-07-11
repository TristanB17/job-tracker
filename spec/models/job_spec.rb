require 'rails_helper'

describe Job do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :description}
    it {should validate_presence_of :level_of_interest}
    it {should validate_presence_of :city}
    it {should validate_presence_of :company_id}
    it {should validate_presence_of :category_id}

  end

  describe "relationships" do
    it {should belong_to(:company)}
    it {should belong_to(:category)}
  end

  describe 'calculations' do
    it 'finds all jobs with same level of interest' do
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
      expected = {3 => 1, 4 => 2, 5 => 2}


      expect(Job.by_interest_level).to eq(expected)
    end
    it 'groups jobs by city' do
      company_1 = Company.create(name: 'WHELP!')
      company_2 = Company.create(name: 'Maybe')
      company_3 = Company.create(name: 'Save Me')
      category = Category.create(title: 'Namekian')
      job_1 = Job.create!(title: 'Developer',
                          description: 'something',
                          level_of_interest: 4,
                          company_id: company_1.id,
                          category_id: category.id,
                          city: "Bratislava")
      job_2 = Job.create!(title: 'Another Dev',
                          description: 'something',
                          level_of_interest: 3,
                          company_id: company_1.id,
                          category_id: category.id,
                          city: "Belgrade")
      job_3 = Job.create!(title: 'Ombudsman',
                          description: 'something else',
                          level_of_interest: 4,
                          company_id: company_2.id,
                          category_id: category.id,
                          city: "Beirut")
      job_4 = Job.create!(title: 'Sven',
                          description: 'Sweden',
                          level_of_interest: 5,
                          company_id: company_2.id,
                          category_id: category.id,
                          city: "Belgrade")
      job_5 = Job.create!(title: 'Another Pev',
                          description: 'something',
                          level_of_interest: 3,
                          company_id: company_3.id,
                          category_id: category.id,
                          city: "Limon")
      expected = {"Limon" => 1, "Belgrade" => 2, "Bratislava" => 1, "Beirut" => 1}

      expect(Job.by_city).to eq(expected)
    end
  end
end
