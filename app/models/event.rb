class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendings
  has_many :comments
  has_many :users_attending, through: :attendings, source: :user
  validates :name, :date, :location, presence: true
end
