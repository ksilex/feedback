class FeedbacksMailer < ApplicationMailer
  def feedback(feedback)
    @feedback = feedback
    mail from: feedback.email
  end
end
