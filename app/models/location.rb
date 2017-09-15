class Location
  attr_reader :long_name, :city, :distance, :phone, :type
  def initialize(attrs)
    @long_name = attrs[:longName]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone = attrs[:phone]
    @type = attrs[:storeType]
  end

  def self.quantity(zipcode)
    BestbuyService.locations(zipcode)[:total]
  end

  def self.locations(zipcode)
    BestbuyService.locations(zipcode)[:stores].map do |raw_location|
      Location.new(raw_location)
    end
  end
end
