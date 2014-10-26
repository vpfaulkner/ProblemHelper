class NotesController < ApplicationController
before_action :authenticate
before_action :set_note, only: [:show, :edit, :update, :destroy]

  def create
    @issue = Issue.find(params[:issue_id])
    @note = @issue.notes.build(notes_params)
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to issue_path(@issue), notice: 'Note was successfully created.' }
#        format.json { render :show, status :created, location: @note }
      else
        format.html { render :new }
#        format.json { render json: @note.errors, status: ok}
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
#        format.json { render :show, status :ok, location: @note }
      else
        format.html { render :edit }
#        format.json { render json: @note.errors, status :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

  def note_params
    params.require(:note).permit(:text, :user_id, :issue_id)
  end

end
