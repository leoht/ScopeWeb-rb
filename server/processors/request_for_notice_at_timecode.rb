# encoding: utf-8

module Scope
  module Processor
  	class RequestForNoticeAtTimecode
  	  def self.process(message)
  	  	notice = ::Notice.where('movie_id = ? and timecode = ?', message.get('movie_id').to_s, message.get('timecode').to_s).first

        if notice.kind_of? ::Notice
          answer = Message.new
          answer.direction = MessageTypes::BROADCAST
          answer.name = MessageTypes::NOTICE_AT_TIMECODE
          # message.data = { :id => notice.id, :title => notice.title, :content => notice.content, :timecode => notice.timecode, :short_content => notice.short_content, :image => notice.image, :category => notice.parent.title, :category_nicename => notice.parent.nicename }
          answer.data = { :id => notice.id.to_s, :title => notice.title, :short_content => notice.short_content, :category_nicename => 'impact' }
          puts " [x] Sending notice for timecode : " + message.get('timecode').to_s
          puts answer.data.inspect
        end

        return answer
  	  end
  	end
  end
end