class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    elsif params[:location]
      @jobs = Job.where(city: params[:location])
      render :index
    else
      @jobs = Job.all
    end

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
    @ordered_comments = @job.order_comments
    @comment = @job.comments.new
  end

  def edit
    # implement on your own!
    @job = Job.find(params[:id])
    @company = Company.find(@job.company_id)
  end

  def update
    # implement on your own!
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_path(@job.company_id)
    else
      render :edit
    end
  end

  def destroy
    # implement on your own!
    @job.destroy
    flash[:success] = "Job successfully deleted"
    redirect_to company_jobs_path(@job.company_id)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :company_id, :category_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end







# 8022792009
