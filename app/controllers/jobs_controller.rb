class JobsController < ApplicationController

  before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    # implement on your own!
    @job = Job.find(params[:id])
    @company = Company.find(@job.company_id)
  end

  def update
    # implement on your own!
    @job.update(job_params)
    redirect_to company_path(@job.company_id)
  end

  def destroy
    # implement on your own!
    @job.destroy
    redirect_to company_jobs_path(@job.company_id)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :company_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end







# 8022792009
