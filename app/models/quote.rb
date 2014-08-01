class Quote
  include Mongoid::Document
  field :quote, type: String
  belongs_to :place
  belongs_to :user

  has_many :votes
end
