class AnimalsController < ApplicationController  
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
    authorize! :edit, @animal
  end

  # POST /animals
  # POST /animals.json
  def create        
    @animal = Animal.new(animal_params)
    @animal.organisation = current_organisation

    if @animal.save
      redirect_to @animal, notice: 'Animal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    authorize! :update, @animal
    if @animal.update(animal_params)
      redirect_to @animal, notice: 'Animal was successfully updated.' 
    else
      render :edit 
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    authorize! :destroy, @animal
    @animal.destroy
    redirect_to animals_url, notice: 'Animal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:name, :sex, :birthdate, :description)
    end
end
