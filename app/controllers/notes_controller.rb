class NotesController < ApplicationController

  def create
    @note = Notes.new
  end

  def update
      this is a note 
  end

  def destroy

  end

  private

  def note_params
    params.require(:note).permitxxx(:text, :user_id, :issue_id)
  end

end
