class MainPublicationsController < ApplicationController
  before_action :set_main_publication, only: [:show, :edit, :update, :destroy]

  # GET /main_publications
  # GET /main_publications.json
  def index
    @main_publications = MainPublication.all
  end

  def get_main_publication
    MainPublication.get_main_publication
  end

  def show_main_publication
    pub_id = params[:some_id]
    @main_publication = MainPublication.where(:publication_id => pub_id).first
    render :show
  end

  # GET /main_publications/1
  # GET /main_publications/1.json
  def show
  end

  # GET /main_publications/new
  def new
    @main_publication = MainPublication.new
  end

  # GET /main_publications/1/edit
  def edit
  end

  # POST /main_publications
  # POST /main_publications.json
  def create
    @main_publication = MainPublication.new(main_publication_params)

    respond_to do |format|
      if @main_publication.save
        format.html { redirect_to @main_publication, notice: 'Main publication was successfully created.' }
        format.json { render :show, status: :created, location: @main_publication }
      else
        format.html { render :new }
        format.json { render json: @main_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main_publications/1
  # PATCH/PUT /main_publications/1.json
  def update
    respond_to do |format|
      if @main_publication.update(main_publication_params)
        format.html { redirect_to @main_publication, notice: 'Main publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_publication }
      else
        format.html { render :edit }
        format.json { render json: @main_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main_publications/1
  # DELETE /main_publications/1.json
  def destroy
    @main_publication.destroy
    respond_to do |format|
      format.html { redirect_to main_publications_url, notice: 'Main publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_publication
      @main_publication = MainPublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_publication_params
      params.require(:main_publication).permit(:elib_id, :name, :main_author, :author_elib_id, :edu_org, :period, :year, :rinz_cited, :nuc_rinz_cited, :scopus_cited, :wos_cited, :imp_f, :norm_cit, :norm_cit_dir, :publication_id, :mephi_index)
    end
end
