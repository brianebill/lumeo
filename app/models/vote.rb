class Vote < ActiveRecord::Base
 include Votable::JoinVote # attr_accessible :title, :body
 votable unique: true
end
