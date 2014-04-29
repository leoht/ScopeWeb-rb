# encoding: utf-8

require_relative 'processors/request_for_notice_at_timecode'
require_relative 'processors/request_for_comment_at_timecode'
require_relative 'processors/post_message'

module Scope
  class MessageProcessor
  	def self.process(message)

      case message.name

      	# device requests notice or comment
      	when MessageTypes::REQUEST_FOR_NOTICE_AT_TIMECODE then
      		if message.get('timecode').to_s != '10'
            processed_message = Scope::Processor::RequestForNoticeAtTimecode.process message
          end

      	when MessageTypes::REQUEST_FOR_COMMENT_AT_TIMECODE then
      		processed_message = Scope::Processor::RequestForCommentAtTimecode.process message

      	# user posts a comment
      	when MessageTypes::POST_MESSAGE then
      		processed_message = Scope::Processor::PostMessage.process message

       	else processed_message = message
      end

      if not processed_message.kind_of? Message
      	processed_message = message
      end
      
      return processed_message
  	end

  	# Check if the processor can handle this message
  	def self.understand?(message)
  	  case message.name
  	  when MessageTypes::REQUEST_FOR_NOTICE_AT_TIMECODE then true
  	  when MessageTypes::REQUEST_FOR_COMMENT_AT_TIMECODE then true
  	  when MessageTypes::POST_MESSAGE then true
  	  else false
  	  end
  	end
  end
end