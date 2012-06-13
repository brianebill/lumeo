class TopicsController < ApplicationController
  def index
    @requests = Request.all
    @questions = Question.all
    @ideas = Idea.all
    @problems = Problem.all
    @compliment = Compliment.new
    @contact = Contact.new
  end
  def show
  end
  def new
   
  end
end