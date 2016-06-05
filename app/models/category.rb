class Category < ActiveRecord::Base
  has_many :products

  def self.get_categories_with_selected(id = nil)
    { all: Category.all, selected: id ? Category.find(id) : nil }
  end
end
