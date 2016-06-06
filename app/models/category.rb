class Category < ActiveRecord::Base
  has_many :products

  def self.all_with_selected(id = nil)
    { all: all, selected: find_by_id(id) }
  end
end
