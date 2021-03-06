# encoding: utf-8

module Scope
  module Processor
  	class RequestForCommentAtTimecode
  	  def self.process(message)
  	  	comment = ::Comment.where('movie_id = ? and timecode = ?', message.get('movie_id').to_s, message.get('timecode').to_s).first

        if comment.kind_of? ::Comment
          answer = Message.new
          answer.direction = MessageTypes::BROADCAST
          answer.name = MessageTypes::COMMENT_AT_TIMECODE

          answer.data = { :id => comment.id, :comment => comment.content, :author => comment.user.name, :facebook_id => comment.user.uid, :timecode => comment.timecode }
          puts " [x] Sending comment for timecode : " + message.get('timecode').to_s
        end

        return answer
  	  end
  	end
  end
end