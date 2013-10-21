class CommentWithNotifications 
  attr_reader :comment

  def self.create(scope, current_user, comment_params)
   comment = scope.build(comment_params)
   comment.user = current_user
   
   new(comment)
  end 

  def initialize(comment)
    @comment = comment
  end

  def save
    if @comment.save
      (@comment.ticket.watchers - [@comment.user]).each do |user| 
        Notifier.comment_updated(@comment, user).deliver 
      end 
    end
  end
end
