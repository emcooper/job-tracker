class JobsController < ApplicationController
  before_action :find_job, only: [:edit, :update, :destroy, :show]
  before_action :find_company, only: [:edit, :create, :show]

  def index
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit

  end

  def update
    @job.update(job_params)
    redirect_to company_job_path(@job.company, @job)
  end

  def destroy
    @job.destroy
    redirect_to @job.company
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def find_job
    @job = Job.find(params[:id])
  end

  def find_company
    # byebug
    @company = Company.find(params[:company_id])
  end
end
