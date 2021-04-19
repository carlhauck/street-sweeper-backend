class CheckPoint
  def initialize(point)
    @point = Geokit::LatLng.new(point[0], point[1])
  end

  def call
    Zone.all.each do |z|
      if Geokit::Polygon
        .new(
          z.coordinates
          .map { |c| Geokit::LatLng.new(c[1], c[0]) })
          .contains?(@point)
        return z.schedules.present? ? z.schedules.sort { |a, b|  a.month_number.to_i <=> b.month_number.to_i } : z
        break
      end
    end
    "ZONE NOT FOUND"
  end
end
