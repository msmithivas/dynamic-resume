class JobsController < ApplicationController
  def index
    matching_jobs = Job.all

    @list_of_jobs = matching_jobs.order({ :created_at => :desc })

    render({ :template => "jobs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_jobs = Job.where({ :id => the_id })

    @the_job = matching_jobs.at(0)

    render({ :template => "jobs/show.html.erb" })
  end

  def create
    the_job = Job.new
    the_job.title = params.fetch("query_title")
    the_job.employer_id = params.fetch("query_employer_id")
    the_job.start_date = params.fetch("query_start_date")
    the_job.end_date = params.fetch("query_end_date")
    the_job.description = params.fetch("query_description")
    the_job.skills = params.fetch("query_skills")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs", { :notice => "Job created successfully." })
    else
      redirect_to("/jobs", { :alert => the_job.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.title = params.fetch("query_title")
    the_job.employer_id = params.fetch("query_employer_id")
    the_job.start_date = params.fetch("query_start_date")
    the_job.end_date = params.fetch("query_end_date")
    the_job.description = params.fetch("query_description")
    the_job.skills = params.fetch("query_skills")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs/#{the_job.id}", { :notice => "Job updated successfully."} )
    else
      redirect_to("/jobs/#{the_job.id}", { :alert => the_job.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.destroy

    redirect_to("/jobs", { :notice => "Job deleted successfully."} )
  end
end
