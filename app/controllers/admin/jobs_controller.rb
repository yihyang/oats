class Admin::JobsController < AdminController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:edit, :new, :create, :update]
  before_action :set_locations, only: [:edit, :new, :create, :update]

  # GET /jobs
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to [:admin, @job], notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      redirect_to [:admin, @job], notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    redirect_to admin_jobs_url, notice: 'Job was successfully destroyed.'
  end

  private

    def set_departments
      @departments = Department.all
    end

    def set_locations
      @locations = Location.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.fetch(:job, {}).permit(
        :name,
        :description,
        :status,
        :url,
        :department_id,
        :location_id,
      )
    end
end
