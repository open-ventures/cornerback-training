class Page < ActiveRecord::Base

  extend Enumerize

  attr_accessible :access, :slug

  enumerize :access, in: {
    public: 1,
    restricted: 2
  }

  validates :slug, presence: true

  
end
