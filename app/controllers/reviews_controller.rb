class ReviewsController < ApplicationController

  def new 
  end 
  
  def create
    @bathroom = Bathroom.find(params[:bathroom_id])
    if field_empty?
      flash[:error] = "Please fill in all fields in order to create a review."
      redirect_to new_bathroom_review_path(@bathroom.id)
    else
      review = @bathroom.reviews.new(review_params)
      if review.save
        flash[:success] = "Review successfully created"
        redirect_to "/bathrooms/#{@bathroom.id}"
      else
        render :new
      end
    end
  end
  
  private
  
  def review_params
    old_params = params.permit(:cleanliness, :experience, :smell, :content, :purchase_required?, :well_stocked?, :cool_decor?)

    new_params = Hash.new

    new_params[:cleanliness] = old_params[:cleanliness].to_i
    new_params[:experience] = old_params[:experience].to_i
    new_params[:smell] = old_params[:smell].to_i
    new_params[:content] = old_params[:content]
    new_params[:purchase_required?] = old_params[:purchase_required?]
    new_params[:well_stocked?] = old_params[:well_stocked?]
    new_params[:cool_decor?] = old_params[:cool_decor?]
    new_params[:user_id] = current_user[:id]
    return new_params
  end

  def field_empty?
    params = review_params
    params[:cleanliness].nil? || params[:experience].nil? || params[:smell].nil?
  end

end 