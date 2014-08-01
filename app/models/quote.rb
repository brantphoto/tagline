class Quote
  include Mongoid::Document
  field :quote, type: String
  belongs_to :place
  belongs_to :person

  has_many :votes 
end
