class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def comment_updated(comment, user)
    @comment = comment
    @user = user
    @ticket = comment.ticket
    @project = @ticket.project

    subject = "[ticketee] #{@project.name} - #{@ticket.title}"

    mail(to: user.email, subject: subject,
         reply_to: "Ticketee App <youraccount+" +
         "#{@project.id}+#{@ticket.id}@example.com>")
  end
end
