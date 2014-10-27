class UserMailer < ActionMailer::Base
  default from: "from@problemhelper.com"

  def new_problem_email(user, new_issue)
    @user = user
    @issue = new_issue
    mail(to: @user.email, subject: 'You created a new issue')
  end

  def issue_note_email(note)
    @note = note
    @issue = @note.issue
    mail(to: @issue.user.email, subject: 'A note has been added to your issue')
  end
end
