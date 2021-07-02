class FeedbacksController < ApplicationController
  def create
    @feedback = current_user ? current_user.feedbacks.new(feedback_params) : Feedback.new(feedback_params)
    if @feedback.save
      FeedbacksMailer.feedback(@feedback).deliver_now
      redirect_to new_feedback_path, notice: 'Feedback was successfully send!'
    end
  end

  def new
    @feedback ||= current_user ? current_user.feedbacks.new : Feedback.new
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end
end
