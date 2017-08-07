class Tag < ActiveRecord::Base
    has_many :poems
    after_initialize :init

    def init
      self.status  ||= "Pending"           #will set the default value only if it's nil
    end

end