class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :decks
  has_many :rounds
  has_many :guesses
end
