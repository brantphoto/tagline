class Person
  include Mongoid::Document
  field :username, type: String
  field :email, type: String

  has_many :quotes
  has_many :votes 
end
