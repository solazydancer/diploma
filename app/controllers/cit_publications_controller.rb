class CitPublicationsController < ApplicationController
  before_action :set_cit_publication, only: [:show, :edit, :update, :destroy]

  # GET /cit_publications
  # GET /cit_publications.json
  def index
    @cit_publications = CitPublication.all
  end

  # GET /cit_publications/1
  # GET /cit_publications/1.json
  def show
  end

  def get_cit_publications
    MainPublication.get_cit_publication
  end

  def show_cit_publications
    publication_id = params[:some_id]
    @cit_publications = CitPublication.where(:source_id => publication_id)
    tmp = CitPublication.where(:source_id => publication_id).first
    pub_tmp = Publication.where(:id => tmp.publication_id).first
    @pub = Publication.where(:id => tmp.publication_id).first
    @main = MainPublication.where(:publication_id => pub_tmp.id).first
    render :index
  end

  # GET /cit_publications/new
  def new
    @cit_publication = CitPublication.new
  end

  # GET /cit_publications/1/edit
  def edit
  end

  # POST /cit_publications
  # POST /cit_publications.json
  def create
    @cit_publication = CitPublication.new(cit_publication_params)

    respond_to do |format|
      if @cit_publication.save
        format.html { redirect_to @cit_publication, notice: 'Cit publication was successfully created.' }
        format.json { render :show, status: :created, location: @cit_publication }
      else
        format.html { render :new }
        format.json { render json: @cit_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cit_publications/1
  # PATCH/PUT /cit_publications/1.json
  def update
    respond_to do |format|
      if @cit_publication.update(cit_publication_params)
        format.html { redirect_to @cit_publication, notice: 'Cit publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @cit_publication }
      else
        format.html { render :edit }
        format.json { render json: @cit_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cit_publications/1
  # DELETE /cit_publications/1.json
  def destroy
    @cit_publication.destroy
    respond_to do |format|
      format.html { redirect_to cit_publications_url, notice: 'Cit publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cit_publication
      @cit_publication = CitPublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cit_publication_params
      params.require(:cit_publication).permit(:elib_id, :name, :source_id, :main_author, :all_author, :periodical_name, :periodical_number)
    end
end
