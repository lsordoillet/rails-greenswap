module ApplicationHelper
  def grid_builder(photos_collection)
    if photos_collection.size == 4
      "four-images-grid"
    elsif photos_collection.size == 3
      "three-images-grid"
    elsif photos_collection.size == 2
      "two-images-grid"
    elsif photos_collection.size == 1
      "one-image-grid"
    else
      "four-images-grid"
    end
  end
end
