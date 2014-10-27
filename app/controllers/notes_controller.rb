class NotesController < ApplicationController
before_action :authenticate_user!
before_action :set_note, only: [:show, :edit, :update, :destroy]

  def create
    @issue = Issue.find(params[:issue_id])
    @note = @issue.notes.build(note_params)
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to issue_path(@issue), success: 'Your note was successfully created.' }
#        format.json { render :show, status :created, location: @note }
        UserMailer.issue_note_email(@note).deliver
      else
        format.html { render :new }
#        format.json { render json: @note.errors, status: ok}
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, success: 'Your note was successfully updated.' }
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
      format.html { redirect_to notes_url, notice: 'Your note was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

  def note_params
    params.require(:note).permit(:text, :user_id, :issue_id)
  end

end
