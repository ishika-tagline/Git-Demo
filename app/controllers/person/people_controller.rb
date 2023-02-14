class Person::PeopleController < ApplicationController

  skip_before_action :configure_permitted_parameters
  
  before_action :get_people
  def index
     render plain: "ok"
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html {redirect_to new_person_path,notice: "Data save succsesfully"}
      else 
        format.html{render :new, status: :unprocessable_entity}
      end
    end
  end
  
  def get_cities_by_state
      @cities=City.where(state_id:params[:state_id].presence)
      render json: @cities
  end
  private 

  def person_params
    params.require(:person).permit(:name,:email,:phone_number,:gender,:city,:state,:country,hobby_ids:[])
  end

  def get_people
    @people=Person.all
    @states=State.all
    @cities=City.all
  end
end
