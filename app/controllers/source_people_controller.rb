class SourcePeopleController < ApplicationController
  before_action :set_source_person, only: [:show, :edit, :update, :destroy]
  #before_action :index, :authenticate_user!

  # GET /source_people
  # GET /source_people.json
  def index
    @source_people = SourcePerson.all
  end

  # GET /source_people/1
  # GET /source_people/1.json
  def show
  end

  # GET /source_people/new
  def new
    @source_person = SourcePerson.new
  end

  # GET /source_people/1/edit
  def edit
  end

  # POST /source_people
  # POST /source_people.json
  def create
    @source_person = SourcePerson.new(source_person_params)

    respond_to do |format|
      if @source_person.save
        format.html { redirect_to @source_person, notice: 'Source person was successfully created.' }
        format.json { render :show, status: :created, location: @source_person }
      else
        format.html { render :new }
        format.json { render json: @source_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_people/1
  # PATCH/PUT /source_people/1.json
  def update
    respond_to do |format|
      if @source_person.update(source_person_params)
        format.html { redirect_to @source_person, notice: 'Source person was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_person }
      else
        format.html { render :edit }
        format.json { render json: @source_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_people/1
  # DELETE /source_people/1.json
  def destroy
    @source_person.destroy
    respond_to do |format|
      format.html { redirect_to source_people_url, notice: 'Source person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_person
      @source_person = SourcePerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_person_params
      params.require(:source_person).permit(:last_name, :first_name, :second_name, :mephi_id, :count, :global_count, :elib_id)
    end
end
