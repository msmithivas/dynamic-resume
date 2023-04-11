class ResumesController < ApplicationController
  def index
    matching_resumes = Resume.all

    @list_of_resumes = matching_resumes.order({ :created_at => :desc })

    render({ :template => "resumes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_resumes = Resume.where({ :id => the_id })

    @the_resume = matching_resumes.at(0)

    render({ :template => "resumes/show.html.erb" })
  end

  def create
    the_resume = Resume.new
    the_resume.name = params.fetch("query_name")
    the_resume.user_id = params.fetch("query_user_id")
    the_resume.display = params.fetch("query_display", false)
    the_resume.objective = params.fetch("query_objective")

    if the_resume.valid?
      the_resume.save
      redirect_to("/resumes", { :notice => "Resume created successfully." })
    else
      redirect_to("/resumes", { :alert => the_resume.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_resume = Resume.where({ :id => the_id }).at(0)

    the_resume.name = params.fetch("query_name")
    the_resume.user_id = params.fetch("query_user_id")
    the_resume.display = params.fetch("query_display", false)
    the_resume.objective = params.fetch("query_objective")

    if the_resume.valid?
      the_resume.save
      redirect_to("/resumes/#{the_resume.id}", { :notice => "Resume updated successfully."} )
    else
      redirect_to("/resumes/#{the_resume.id}", { :alert => the_resume.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_resume = Resume.where({ :id => the_id }).at(0)

    the_resume.destroy

    redirect_to("/resumes", { :notice => "Resume deleted successfully."} )
  end
end
