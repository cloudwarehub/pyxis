class ClusterSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :token
  belongs_to :region
  has_many :hosts

end
