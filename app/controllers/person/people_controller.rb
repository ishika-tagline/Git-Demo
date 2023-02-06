class Person::PeopleController < ApplicationController

  def index
     render plain: "ok"
  end

  def new
    @person=Person.new
  end

  def create
    @person=Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html {redirect_to person_url(@person),notice: "Data save succsesfully"}
      else 
        format.html{render :new, status: :unprocessable_entity}
      end
    end
  end
  private 

  def person_params
    params.require(:person).permit(:name,:email,:phone_number,:gender,:city,:state,:country,:hobby)
  end
end
