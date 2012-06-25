module VotesHelper
   def vote_total(votes)
     # if you just want the total, this is sufficient
     votes.inject(0) { |sum,vote| sum += vote.value }
   end
end
