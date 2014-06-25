class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  before_validation :combine_user_post
  validates_uniqueness_of :combined_params

  private
  
  # create a combined column so that we
  # can validate that a user can't vote
  # for the same post more than once.
  def combine_user_post
    # concatenate user_id and post_id as integers
    self.combined_params = (self.user_id.to_s << self.post_id.to_s).to_i
  end

end
