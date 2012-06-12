class Community < ActiveRecord::Base
  attr_accessible :description, :name, :school_id
  
  #module Community
    def self.table_name_prefix
      'community_'
    end
 # end
end
