class Tag < ActiveRecord::Base
    has_many :poems
    has_many :taggings
    has_many :tags, through: :taggings
    after_initialize :init

    def init
      self.status  ||= "Pending"           #will set the default value only if it's nil
    end

end