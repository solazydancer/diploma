class SubPublicationsController < ApplicationController
  before_action :set_sub_publication, only: [:show, :edit, :update, :destroy]

  # GET /sub_publications
  # GET /sub_publications.json
  def index
    @sub_publications = SubPublication.all
  end

  def show_sub_publications
    tmp_id = params[:some_id]
    @period = SubPublication.where(:period_id => tmp_id).first
    @sub_publications = SubPublication.where(:period_id => tmp_id)
    render :index
  end

  # GET /sub_publications/1
  # GET /sub_publications/1.json
  def show
  end

  # GET /sub_publications/new
  def new
    @sub_publication = SubPublication.new
  end

  # GET /sub_publications/1/edit
  def edit
  end

  # POST /sub_publications
  # POST /sub_publications.json
  def create
    @sub_publication = SubPublication.new(sub_publication_params)

    respond_to do |format|
      if @sub_publication.save
        format.html { redirect_to @sub_publication, notice: 'Sub publication was successfully created.' }
        format.json { render :show, status: :created, location: @sub_publication }
      else
        format.html { render :new }
        format.json { render json: @sub_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_publications/1
  # PATCH/PUT /sub_publications/1.json
  def update
    respond_to do |format|
      if @sub_publication.update(sub_publication_params)
        format.html { redirect_to @sub_publication, notice: 'Sub publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_publication }
      else
        format.html { render :edit }
        format.json { render json: @sub_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_publications/1
  # DELETE /sub_publications/1.json
  def destroy
    @sub_publication.destroy
    respond_to do |format|
      format.html { redirect_to sub_publications_url, notice: 'Sub publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_publication
      @sub_publication = SubPublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_publication_params
      params.require(:sub_publication).permit(:period_name, :edu_org, :number, :year, :pub_id, :pub_name, :pub_author, :pub_page, :pub_cited, :publication_id)
    end
end
