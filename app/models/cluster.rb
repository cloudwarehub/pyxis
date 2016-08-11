class Cluster < ApplicationRecord
  attr_accessor :token

  belongs_to :region, optional: true
  has_many :hosts

end
