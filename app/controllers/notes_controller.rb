class NotesController < ApplicationController

  def create

  end


  def destroy

  end

  private

  def note_params
    params.require(:note).permit(:text, :user_id, :issue_id)
  end

end
