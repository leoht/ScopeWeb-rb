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

          end_timecode = notice.end_timecode ? notice.end_timecode : notice.timecode.to_i + 30

          answer.data = { :timecode => message.get('timecode').to_s, :end_timecode => end_timecode, :id => notice.id.to_s, :title => notice.title, :short_content => notice.short_content, :color => category.color, :category_nicename => category.parent.nicename, :category_title => category.title }
          puts " [x] Sending notice for timecode : " + message.get('timecode').to_s
          puts answer.data.inspect

          # Register that user has seen this notice
          if message.get('uid')
            uid = message.get('uid')
            user = User.find_by_uid uid
            user.notices << notice
            puts " [x] Registering user notice."
            user.save
          end
        end

        return answer
  	  end
  	end
  end
end