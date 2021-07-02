class Admin::FeedbacksController < Admin::BaseController
  def index
    if search_params
      @feedbacks = Feedback.order(created_at: :desc).where('name ilike :search OR email ilike :search OR text ilike :search', search: "%#{search_params.downcase}%").page(params[:page])
    else
      @feedbacks = Feedback.order(created_at: :desc).page(params[:page])
    end
  end

  def search_params
    params[:search]
  end
end
