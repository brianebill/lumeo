class TopicsController < ApplicationController
  def index
    @requests = Request.all
    @questions = Question.all
    @ideas = Idea.all
    @problems = Problem.all
    @compliment = Compliment.new
    @contact = Contact.new
    @recent_requests = Request.all(:order => 'created_at DESC', :limit => 10)
    @popular_requests = Request.order('user_votes_total DESC').order('created_at DESC').limit(10)
    @recent_compliments = Compliment.all(:order => 'created_at DESC', :limit => 10)
    @popular_compliments = Compliment.order('user_votes_total DESC').order('created_at DESC').limit(10)
  end
  def show
  end
  def new
   
  end
end