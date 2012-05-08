class Course < ActiveRecord::Base
  attr_accessible :index_text, :school_id, :show_text, :title, :total_running_time
end
