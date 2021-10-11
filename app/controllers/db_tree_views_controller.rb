class DbTreeViewsController < ApplicationController
  before_action :set_db_tree_view, only: %i[ show edit update destroy ]

  # GET /db_tree_views or /db_tree_views.json
  def index
    @db_tree_views = DbTreeView.all
  end

  # GET /db_tree_views/1 or /db_tree_views/1.json
  def show
  end

  # GET /db_tree_views/new
  def new
    @db_tree_view = DbTreeView.new
  end

  # GET /db_tree_views/1/edit
  def edit
  end

  # POST /db_tree_views or /db_tree_views.json
  def create
    @db_tree_view = DbTreeView.new(db_tree_view_params)

    respond_to do |format|
      if @db_tree_view.save
        format.html { redirect_to @db_tree_view, notice: "Db tree view was successfully created." }
        format.json { render :show, status: :created, location: @db_tree_view }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @db_tree_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /db_tree_views/1 or /db_tree_views/1.json
  def update
    respond_to do |format|
      if @db_tree_view.update(db_tree_view_params)
        format.html { redirect_to @db_tree_view, notice: "Db tree view was successfully updated." }
        format.json { render :show, status: :ok, location: @db_tree_view }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @db_tree_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /db_tree_views/1 or /db_tree_views/1.json
  def destroy
    @db_tree_view.destroy
    respond_to do |format|
      format.html { redirect_to db_tree_views_url, notice: "Db tree view was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_db_tree_view
      @db_tree_view = DbTreeView.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def db_tree_view_params
      params.fetch(:db_tree_view, {})
    end
end
