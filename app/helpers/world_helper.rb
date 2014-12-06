module WorldHelper
  def find_place houses, place_id 
    houses.select { |h| h.place_id == place_id }.first
  end
end
