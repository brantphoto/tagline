class Quote
  include Mongoid::Document
  field :quote, type: String
  belongs_to :location
  belongs_to :user

  has_many :votes
end
