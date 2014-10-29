class IssuesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @issue = Issue.new
  end

  def create
    @issue = current_user.issues.build(issue_params)
    respond_to do |format|
      format.html do
        if @issue.save
          redirect_to @issue, success: "Your issue has been created."
          # UserMailer.new_problem_email(current_user, @issue).deliver
        else
          redirect_to new_issue_path
        end
      end
      format.js do
        if @issue.save
          render "/issues/new", status: :created
          # UserMailer.new_problem_email(current_user, @issue).deliver
        else
          redirect_to new_issue_path
        end
      end
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
      respond_to do |format|
        format.html do
          @issue.update_attribute(:resolved, true)
          @issue.save
          redirect_to @issue, success: "Your issue has been resolved."
        end
        format.js do
          @issue.update_attribute(:resolved, true)
          @issue.save
          render "/issues/resolve", status: :created
        end
      end
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
