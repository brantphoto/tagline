class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Paperclip

  has_mongoid_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

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