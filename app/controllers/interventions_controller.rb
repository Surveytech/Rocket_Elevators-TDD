require 'zendesk_api'
class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  # before_action :require_user, :only => 'show'
  before_action :is_employee #check if current user is employee

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

  #Get the building for the selected customer
  def get_building_by_customer
    puts "get building by customer"
    @building = Building.where(customer_id: params[:customer_id])
        respond_to do |format|
        format.json { render :json => @building }
    end
  end
  
  #Get the battery for the selected building
  def get_battery_by_building
    puts "get battery by building"
    @battery = Battery.where(building_id: params[:building_id])
        respond_to do |format|
        format.json { render :json => @battery }
    end
  end

  #Get the column for the selected battery
  def get_column_by_battery
    puts "get column by battery"
    @column = Column.where(battery_id: params[:battery_id])
    puts @column
        respond_to do |format|
        format.json { render :json => @column }
    end
  end
  #Get the elevator for the selected column
  def get_elevator_by_column
    puts "get elevator by column"
    @elevator = Elevator.where(column_id: params[:column_id])
        respond_to do |format|
        format.json { render :json => @elevator }
    end
  end

  def create_zendesk
 
    # @employee_name = Employee.find_by(current_user.id)
    # @customer_name = Customer.find_by(customer_id)
    # @field_employee = Employee.find_by(employee_id)

    client = ZendeskAPI::Client.new do |config|
        config.url = ENV['ZENDESK_URL']
        config.username = ENV["ZENDESK_EMAIL"]
        config.token = ENV["ZENDESK_TOKEN"]
    end
    ZendeskAPI::Ticket.create!(client,
    :subject => "Intervention from Employee ##{@intervention.author_id}",
    :comment => {
        :value => "Needs Intervention in the building ##{@intervention.building_id} for the customer: #{@intervention.customer_id}.
        
        Battery ID : #{@batt}
        Column ID : #{@col} 
        Elevator ID : #{@elev}

        The employee assign is : #{@intervention.employee_id}.
        
        Brief description of the intervention: #{@intervention.report}."
    },

    :priority => "urgent",
    :type => "problem"
    )
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new
    
    @batt = params[:Battery]
    @col = params[:Column]
    @elev = params[:Elevator]
    @intervention.author_id = current_user.id
    @intervention.customer_id = params[:Customer]
    @intervention.building_id = params[:Building]
    @intervention.battery_id = params[:Battery]
    @intervention.column_id = params[:Column]
    @intervention.elevator_id = params[:Elevator]
    @intervention.employee_id = params[:Employee]
    @intervention.report = params[:report]
    
    if @intervention.elevator_id 
        @intervention.battery_id = nil
        @intervention.column_id = nil
    elsif @intervention.column_id
        @intervention.battery_id = nil
    end    


    @intervention.save!
 

    if @intervention.save
      create_zendesk()

      redirect_to interventions_path, notice: "Message sent!"
    # else    
    #   redirect_to "/leads", notice: "Invalid fields!"
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
        params.permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :intervention_start, :intervention_end, :result, :report, :status)
    end
end
