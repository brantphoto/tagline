class User
  include Mongoid::Document
  field :username, type: String
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :phonenumber, type: String
  
  has_many :quotes
  has_many :votes
  
end