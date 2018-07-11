class CommentsController < ApplicationController

  def create
    job = Job.find(params[:job_id])
    comment = job.comments.create(comment_params)
    redirect_to job_path(job.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:job_id, :message)
  end
end
