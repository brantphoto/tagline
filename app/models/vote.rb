class Vote
  include Mongoid::Document
  
  validates :user_id, :uniqueness => {:scope => [:user_id, :quote_id]}
  belongs_to :quote
  belongs_to :user
end

