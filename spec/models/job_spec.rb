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
end
