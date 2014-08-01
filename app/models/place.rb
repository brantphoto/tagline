class Place
  include Mongoid::Document
  field :name, type: String
  field :location, type: String

  has_many :quotes
end
