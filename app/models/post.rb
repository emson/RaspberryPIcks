class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  # has_many :voters, foreign_key: 'user_id', class_name: 'User', through: :votes
  has_many :votes
  validates_presence_of :title

end
