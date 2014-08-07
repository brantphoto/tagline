class Location
  include Mongoid::Document
  field :name, type: String
  field :zipcode, type: String

  has_many :quotes
end