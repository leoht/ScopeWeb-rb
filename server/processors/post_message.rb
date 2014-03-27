# encoding: utf-8

module Scope
  module Processor
  	class PostMessage
  	  def self.process(message)
  	  	comment = Comment.new
  	  	comment.content = message.get 'message'
  	  	comment.timecode = message.get 'timecode'
  	  	comment.movie_id = message.get 'movie_id'
  	  	comment.save

  	  	user = User.find_by_uid message.get('facebook_id')
  	  	user.comments << comment
  	  	user.save

  	  	answer = Message.new
  	  	answer.direction = MessageTypes::BROADCAST
  	  	answer.name = 'api.social.posted'
  	  	answer.data = { :message_id => comment.id }

  	  	return answer
  	  end
  	end
  end
end