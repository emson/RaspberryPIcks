class VotesController < ApplicationController

  # add cancan authorizing
  # load_and_authorize_resource


  # vote /votes
  # vote /votes.json
  def create
    authorize! :create, Vote
    if user_signed_in?
      # merge current_user.id into params
      merged_params = vote_params.merge(user_id: current_user.id)
      @vote = Vote.new(merged_params)
      respond_to do |format|
        if @vote.save
          format.html { redirect_to root_path, notice: 'Vote was successfully created.' }
        else
          format.html { redirect_to root_path }
        end
      end
    else
      redirect_to root_path
    end
  end


  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    authorize! :destroy, Vote
    if params[:id] == '0'
      if user_signed_in?
        vote = current_user.votes.find_by_post_id(params[:vote][:post_id])
        vote.try(:destroy)
      end
    else
      Vote.find(params[:id]).destroy
    end
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_vote
  #   @vote = Vote.friendly.find(params[:id])
  # end

  def vote_params
    params.require(:vote).permit(:user_id, :post_id, :combined_params)
  end

end
