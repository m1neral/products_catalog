class Role < ActiveRecord::Base
  has_many :users

  serialize :actions
end
