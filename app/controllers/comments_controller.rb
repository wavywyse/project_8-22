class CommentsController < ApplicationController
	def create
		event = Event.find(params[:id])
		comment = Comment.new(content:params[:content], event:event, user:current_user)
		if comment.save
			redirect_to "/events/#{params[:id]}"
		else
			flash[:errors] = comment.errors.full_messages
			redirect_to "/events/#{params[:id]}"
		end
	end
end
