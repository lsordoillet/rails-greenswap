class ReviewsController < ApplicationController
  def new
    @chatroom = Chatroom.find(params[:chatroom_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @chatroom = Chatroom.find(params[:chatroom_id])
    @review.chatroom = @chatroom
    authorize @review
    if @review.save
      redirect_to profile_path(@profile), notice: "Review was added."
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
