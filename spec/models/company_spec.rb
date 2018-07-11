require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end


  describe "relationships" do
    it {should have_many(:contacts)}
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
    it 'has many contacts' do
      company = Company.create(name: 'Spongebob')
      expect(company).to respond_to(:contacts)
    end
  end
end
context 'calculations' do
  it 'returns top three companies by job level of interest' do
    company_1 = Company.create(name: 'WHELP!')
    company_2 = Company.create(name: 'Maybe')
    company_3 = Company.create(name: 'Save Me')
    category = Category.create(title: 'Namekian')
    job_1 = Job.create!(title: 'Developer',
                        description: 'something',
                        level_of_interest: 4,
                        company_id: company_1.id,
                        category_id: category.id,
                        city: "Moscow")
    job_2 = Job.create!(title: 'Another Dev',
                        description: 'something',
                        level_of_interest: 4,
                        company_id: company_1.id,
                        category_id: category.id,
                        city: "Moscow")
    job_3 = Job.create!(title: 'Ombudsman',
                        description: 'something else',
                        level_of_interest: 5,
                        company_id: company_2.id,
                        category_id: category.id,
                        city: "Moscow")
    job_4 = Job.create!(title: 'Sven',
                        description: 'Sweden',
                        level_of_interest: 5,
                        company_id: company_2.id,
                        category_id: category.id,
                        city: "Moscow")
    job_5 = Job.create!(title: 'Another Pev',
                        description: 'something',
                        level_of_interest: 3,
                        company_id: company_3.id,
                        category_id: category.id,
                        city: "Moscow")


    expected_result = 2
    expected_name = 'Maybe'

    expect(Company.company_by_interest.first.id).to eq(expected_result)
    expect(Company.company_by_interest.first.name).to eq(expected_name)
    end
  end
end
