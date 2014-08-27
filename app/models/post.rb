class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :votes, dependent: :destroy

  validates_presence_of :title
  validates_uniqueness_of :url

  after_create :create_default_vote

  private

  def create_default_vote
    self.votes.create!(user_id: self.user.id)
  end

end
