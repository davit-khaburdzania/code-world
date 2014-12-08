module WorldHelper
  def find_place houses, stores, place_id 
    building = houses.select { |h| h.place_id == place_id }.first

    if !building
      building = stores.select { |s| s.place_id == place_id }.first
    end

    building
  end
end
