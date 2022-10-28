class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({:template => "director_templates/index.html.erb"})
  end

  def wisest
    @oldest_director = Director.where.not({:dob => nil}).order({:dob => :asc}).at(0)
    render({:template => "director_templates/wisest.html.erb"})
  end

  def youngest
    @youngest_director = Director.where.not({:dob => nil}).order({:dob => :desc}).at(0)
    render({:template => "director_templates/youngest.html.erb"})
  end


  def director_details

    @the_id = params.fetch("an_id")
    @the_director = Director.all.where({:id=> @the_id}).at(0)
    
    render({:template => "director_templates/details.html.erb"})
  
  end
end
