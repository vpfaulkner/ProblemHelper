class IssuesController < ApplicationController


  def index

  end

  def new

  end

  def create

  end

  def show

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
