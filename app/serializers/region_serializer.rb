class RegionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :country, :city
  has_many :clusters
end
