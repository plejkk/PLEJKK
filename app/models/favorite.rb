class Favorite < ApplicationRecord
	belongs_to :user, dependent: :destroy
	belongs_to :joke, dependent: :destroy
end
