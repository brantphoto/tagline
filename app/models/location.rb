class Location
  include Mongoid::Document
  field :name, type: String
  field :zipcode, type: String

  has_many :quotes

  def self.search(query)
    where(:name => query) 
    # where("name like ?" => "%#{query}%") 
  end
end