class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Paperclip

  has_mongoid_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_presence_of :username, :email, :password, :password_confirmation
  validates :username, length: { in: 3..10 }
  validates :password, length: { in: 5..12 }
  validates_format_of :email, :with => /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
  validates_format_of :username, :with => /\A[a-zA-Z]+\z/
  validates_uniqueness_of :username, :email 

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