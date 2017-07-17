class JobsController < ApplicationController
  before_action :find_job, only: [:edit, :update, :destroy, :show]
  before_action :find_company, only: [:edit, :create, :show]

  def index
    @company = Company.find(params[:company_id])
    @contact = Contact.new
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

  def dashboard
    @jobs_interest_count = Job.count(:level_of_interest)
    @jobs_city_count = Job.count(:city)
    @top_companies_by_interest = Company.top_by_interest
  end

  def sort
    if @criteria = params[:sort]
      @result = Job.sort(@criteria)
    elsif @criteria = params[:location]
      @result = Job.filter_location(@criteria)
      render "filter"
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def find_job
    @job = Job.find(params[:id])
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end
