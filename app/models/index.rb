class Index < ApplicationRecord
  has_many :elements

  validates :url, format: { with: URI::regexp(%w(http https)), message: "must be formatted correctly, please add http or https"}, presence: true
end
