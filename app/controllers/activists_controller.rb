class ActivistsController < ApplicationController
  before_action :set_activist, only: [:show, :edit, :update, :destroy]

  # GET /activists
  # GET /activists.json
  def index
    @activists = Activist.all
  end

  # GET /activists/1
  # GET /activists/1.json
  def show
  end

  # GET /activists/new
  def new
    @activist = Activist.new
  end

  # GET /activists/1/edit
  def edit
  end

  # POST /activists
  # POST /activists.json
  def create
    @activist = Activist.new(activist_params)

    respond_to do |format|
      if @activist.save
        format.html { redirect_to @activist, notice: 'Activist was successfully created.' }
        format.json { render :show, status: :created, location: @activist }
      else
        format.html { render :new }
        format.json { render json: @activist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activists/1
  # PATCH/PUT /activists/1.json
  def update
    respond_to do |format|
      if @activist.update(activist_params)
        format.html { redirect_to @activist, notice: 'Activist was successfully updated.' }
        format.json { render :show, status: :ok, location: @activist }
      else
        format.html { render :edit }
        format.json { render json: @activist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activists/1
  # DELETE /activists/1.json
  def destroy
    @activist.destroy
    respond_to do |format|
      format.html { redirect_to activists_url, notice: 'Activist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activist
      @activist = Activist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activist_params
      params.require(:activist).permit(:uuid)
    end
end
