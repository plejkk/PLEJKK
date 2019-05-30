class Joke < ApplicationRecord
	has_many :favorite, dependent: :destroy
	has_many :comment, dependent: :destroy
end
