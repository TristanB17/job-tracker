class DashboardController < ApplicationController

  def show
    @jobs_by_interest = Job.by_interest_level
    @companies_by_job_interest = Company.company_by_interest
    @jobs_by_city = Job.by_city 
    render :show
  end
end
