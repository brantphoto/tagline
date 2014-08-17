class Quote
  include Mongoid::Document
  validates_presence_of :quote
  validates :quote, length: { in: 2..140 }

  field :quote, type: String
  belongs_to :location
  belongs_to :user

  has_many :votes

end
