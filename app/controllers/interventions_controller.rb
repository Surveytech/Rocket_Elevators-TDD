class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  # before_action :is_employee #check if current user is employee
  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  def get_building_by_customer
    puts "get building by customer"
    puts params[:customer_id]
    @building = Building.where(customer_id: params[:customer_id])
        respond_to do |format|
        format.json { render :json => @building }
    end
  end
  def building_search
    puts "building search getting called"
    if params[:customer].present? && params[:customer].strip != ""
      @building = Building.where("building_id = ?", params[:customer])
    else
      @building = Building.all
    end
  end
  
  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to @intervention, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :intervention_start, :intervention_end, :result, :report, :status)
    end
end
