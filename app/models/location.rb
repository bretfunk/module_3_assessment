class Location
  attr_reader :long_name, :city, :distance, :phone, :type
  def initialize(attrs)
    @long_name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone = attrs[:phone]
    @type = attrs[:storeType]
  end
end
