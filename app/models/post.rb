class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  # has_many :voters, foreign_key: 'user_id', class_name: 'User', through: :votes
  has_many :votes
  validates_presence_of :title
  # accepts_nested_attributes_for :votes
  after_create :create_default_vote

  private

  def create_default_vote
    self.votes.create!(user_id: self.user.id)
  end

end
