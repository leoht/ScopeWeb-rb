# encoding: utf-8

require_relative 'processors/request_for_notice_at_timecode'

module Scope
  class MessageProcessor
  	def self.process(message)
  	  processed_message = message

      processed_message = case message.name
      	when MessageTypes::REQUEST_FOR_NOTICE_AT_TIMECODE then Scope::Processor::RequestForNoticeAtTimecode.process message
       	else message
      end
      
      return processed_message
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