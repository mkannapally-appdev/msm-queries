class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({:template => "director_templates/index.html.erb"})
  end

  def wisest
    @oldest_director = Director.where.not({:dob => nil}).order({:dob => :asc}).at(0)
    render({:template => "director_templates/wisest.html.erb"})
  end
end
