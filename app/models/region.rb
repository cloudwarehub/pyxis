class Region < ApplicationRecord
  has_many :clusters

  #accepts_nested_attributes_for :clusters
end
