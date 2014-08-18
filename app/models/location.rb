class Location
  include Mongoid::Document
  field :name, type: String
  field :streetadd, type: String
  field :city, type: String
  field :state, type: String
  field :zipcode, type: String

  has_many :quotes

  def self.search(query)
    # qlength = query.length
    where(:name => query)
    # where("name like ?" => query)
  end
end