class IssuesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index

  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = current_user.issues.build(issue_params)
    if @issue.save
      redirect_to @issue, success: "Your issue has been created."
    else
      redirect_to new_issue_path
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def update

  end

  def destroy

  end

  def resolve

  end

  private

  def issue_params
    params.require(:issue).permit(:description, :tried_description, :user_id, :resolved)
  end

end
