class HostSerializer < ActiveModel::Serializer
  attributes :id, :name, :ip, :os, :num_cpu, :memory, :disk
  belongs_to :cluster
end
