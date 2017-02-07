class Search < ActiveRecord::Base
  
  def search_books
    
    rooms = Room.all
    
    rooms = rooms.where(["gender LIKE ?", "%#{gender}%"]) if gender.present?
    rooms = rooms.where(["start_date <= ?",start_date]) if start_date.present?
    rooms = rooms.where(["finish_date >= ?", finish_date]) if finish_date.present?
    rooms = rooms.where(["room_private LIKE ?","%#{room_private}%"]) if room_private.present?
    rooms = rooms.where(["price <= ?", price]) if price.present?
    
    return rooms
  end
end
