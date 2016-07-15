class Deck < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator
  has_many :cards
  has_many :rounds
end
