# encoding: utf-8

require_relative 'processors/request_for_notice_at_timecode'

module Scope
  class MessageProcessor
  	def self.process(message)
  	  if message.name == MessageTypes::REQUEST_FOR_NOTICE_AT_TIMECODE
        processed_message = case message.name
        	when MessageTypes::REQUEST_FOR_NOTICE_AT_TIMECODE then RequestForNoticeAtTimecode.process message
        	else message
        end
      end
  	end

  	# Check if the processor can handle this message
  	def self.understand?(message)
  	  case message.name
  	  when MessageTypes::REQUEST_FOR_NOTICE_AT_TIMECODE then true
  	  else false
  	  end
  	end
  end
end