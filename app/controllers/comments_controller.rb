class CommentsController < ApplicationController
  def new
    Event.find(params[:id]).comments.create(comment: params[:comment], user_id: session[:user])
    redirect_to '/events/show/'+params[:id]
  end
end
