class EmployersController < ApplicationController
  def index
    matching_employers = Employer.all

    @list_of_employers = matching_employers.order({ :created_at => :desc })

    render({ :template => "employers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_employers = Employer.where({ :id => the_id })

    @the_employer = matching_employers.at(0)

    render({ :template => "employers/show.html.erb" })
  end

  def create
    the_employer = Employer.new
    the_employer.name = params.fetch("query_name")
    the_employer.location = params.fetch("query_location")
    the_employer.jobs_count = params.fetch("query_jobs_count")

    if the_employer.valid?
      the_employer.save
      redirect_to("/employers", { :notice => "Employer created successfully." })
    else
      redirect_to("/employers", { :alert => the_employer.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_employer = Employer.where({ :id => the_id }).at(0)

    the_employer.name = params.fetch("query_name")
    the_employer.location = params.fetch("query_location")
    the_employer.jobs_count = params.fetch("query_jobs_count")

    if the_employer.valid?
      the_employer.save
      redirect_to("/employers/#{the_employer.id}", { :notice => "Employer updated successfully."} )
    else
      redirect_to("/employers/#{the_employer.id}", { :alert => the_employer.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_employer = Employer.where({ :id => the_id }).at(0)

    the_employer.destroy

    redirect_to("/employers", { :notice => "Employer deleted successfully."} )
  end
end
