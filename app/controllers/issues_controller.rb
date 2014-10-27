class IssuesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index

  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = current_user.issues.build(issue_params)
    if @issue.save
      redirect_to @issue, success: "Your issue has been created."
      UserMailer.new_problem_email(current_user, @issue).deliver
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
    @issue = Issue.find(params[:issue_id])
    if current_user && current_user.id == @issue.user.id
      @issue.update_attribute(:resolved, true)
      @issue.save
      redirect_to @issue, success: "Your issue has been resolved."
    else
      redirect_to @issue, alert: "You must be the issue owner to resolve"
    # ADD ELSE FLASH
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:description, :tried_description, :user_id, :resolved)
  end

end
