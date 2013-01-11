class Comment < ActiveRecord::Base

	attr_accessible :video_title
	attr_accessible :content

	def self.yt_session
    @yt_session ||= YouTubeIt::Client.new    
  end

  def self.populate
  	topviewed = Comment.yt_session.videos_by(:categories => [:music], :order_by => :viewCount, :max_results => 50)
  	@new_comments = []
  	topviewed.videos.each do |video|
			video_id = video.video_id.split(':').last
			comments = Comment.yt_session.comments(video_id)
			unless comments.empty?
				@new_comments << { :video_title => video.title, :content => comments[0].content }
			end
		end
		@new_comments.each { |comment| Comment.create(comment) }
	end

end
