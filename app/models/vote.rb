class Vote
  include Mongoid::Document
  belongs_to :quote
  belongs_to :person
end
