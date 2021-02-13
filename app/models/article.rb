class Article < ApplicationRecord
  belongs_to :tag, dependent: :destroy
end
