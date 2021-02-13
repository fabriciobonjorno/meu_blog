class Tag < ApplicationRecord
  has_many :articles, dependent: :destroy
end
