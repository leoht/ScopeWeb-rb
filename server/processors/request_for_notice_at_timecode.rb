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

          category = NoticeCategory.find notice.notice_category_id

          answer.data = { :timecode => message.get('timecode').to_s, :id => notice.id.to_s, :title => notice.title, :short_content => notice.short_content, :color => category.color, :category_nicename => category.parent.nicename }
          puts " [x] Sending notice for timecode : " + message.get('timecode').to_s
          puts answer.data.inspect
        end

        return answer
  	  end
  	end
  end
end