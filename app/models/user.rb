class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :username, type: String
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :phonenumber, type: String
  field :password_digest, type: String
  field :is_active, type: Mongoid::Boolean

  has_secure_password
  
  has_many :quotes
  has_many :votes 
  
end