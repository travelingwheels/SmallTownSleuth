module CommentsHelper

  def empty_variable_message
    if @comments.empty?
      "There doesn't seem to be any comments, 
      To be the first to comment on this review click the link below!"
    end
  end
end
