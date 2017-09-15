class Presenter
attr_reader :zipcode
def initialize(zipcode)
  @zipcode = zipcode
end

  def quantity
    Location.quantity(zipcode)
  end

  def locations
    Location.for_user(zipcode)
  end
end
