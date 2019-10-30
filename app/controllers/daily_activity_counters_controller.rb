class DailyActivityCountersController < ApplicationController
  before_action :set_daily_activity_counter, only: [:show, :edit, :update, :destroy]

  def graph
    @daily_activity_counters = DailyActivityCounter.where(activist_id: params[:activist_id], type: params[:type])
    @counter_hash = {}
    @daily_activity_counters.each { |v| @counter_hash[v.date] = v.count }
    from = params[:from]&.to_date || 1.year.ago.to_date
    to = params[:to]&.to_date || Date.current
    @target_range = from...to
    html = render_to_string(partial: 'graph')
    render json: { html: html }
  end

  # GET /daily_activity_counters
  # GET /daily_activity_counters.json
  def index
    @daily_activity_counters = DailyActivityCounter.all
  end

  # GET /daily_activity_counters/1
  # GET /daily_activity_counters/1.json
  def show
  end

  # GET /daily_activity_counters/new
  def new
    @daily_activity_counter = DailyActivityCounter.new
  end

  # GET /daily_activity_counters/1/edit
  def edit
  end

  # POST /daily_activity_counters
  # POST /daily_activity_counters.json
  def create
    @daily_activity_counter = DailyActivityCounter.new(daily_activity_counter_params)

    respond_to do |format|
      if @daily_activity_counter.save
        format.html { redirect_to @daily_activity_counter, notice: 'Daily activity counter was successfully created.' }
        format.json { render :show, status: :created, location: @daily_activity_counter }
      else
        format.html { render :new }
        format.json { render json: @daily_activity_counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_activity_counters/1
  # PATCH/PUT /daily_activity_counters/1.json
  def update
    respond_to do |format|
      if @daily_activity_counter.update(daily_activity_counter_params)
        format.html { redirect_to @daily_activity_counter, notice: 'Daily activity counter was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_activity_counter }
      else
        format.html { render :edit }
        format.json { render json: @daily_activity_counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_activity_counters/1
  # DELETE /daily_activity_counters/1.json
  def destroy
    @daily_activity_counter.destroy
    respond_to do |format|
      format.html { redirect_to daily_activity_counters_url, notice: 'Daily activity counter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_activity_counter
      @daily_activity_counter = DailyActivityCounter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_activity_counter_params
      params.require(:daily_activity_counter).permit(:type, :activist_id, :date, :count)
    end
end
