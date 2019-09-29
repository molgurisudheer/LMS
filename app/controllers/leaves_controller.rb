class LeavesController < ApplicationController
  before_action :set_leave, only: [:show, :edit, :update, :destroy, :approve, :reject]

  # GET /leaves
  # GET /leaves.json
  def index
    @leaves = if current_user.reporting_head?
                current_user.leaves_waiting_for_approval
              else
                current_user.leaves
              end
             # raise reporting_heads.inspect
             # if !reporting_head.user_name.blank?
    @reporting_head = User.reporting_heads.first
 end
#end
  # GET /leaves/1
  # GET /leaves/1.json
  def show
  end

  # GET /leaves/new
  def new
    @leave = Leave.new
  end

  # GET /leaves/1/edit
  def edit
  end

  # POST /leaves
  # POST /leaves.json
  def create
    @leave = Leave.new(leave_params)

    respond_to do |format|
      if @leave.save
        format.html { redirect_to @leave, notice: 'Leave was successfully created.' }
        format.json { render :show, status: :created, location: @leave }
      else
        format.html { render :new }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaves/1
  # PATCH/PUT /leaves/1.json
  def update
    respond_to do |format|
      if @leave.update(leave_params)
        format.html { redirect_to @leave, notice: 'Leave was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave }
      else
        format.html { render :edit }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaves/1
  # DELETE /leaves/1.json
  def destroy
    @leave.destroy
    respond_to do |format|
      format.html { redirect_to leaves_url, notice: 'Leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @leave.status = "Approved"
    @leave.save
    flash[:notice] = 'You have Successfully Approved'
    redirect_to :leaves

  end

  def reject
    @leave.status = "Rejected"
    @leave.save
    flash[:notice] = 'You have Successfully Rejected'
    redirect_to :leaves
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave
      @leave = Leave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_params
      params.require(:leave).permit(:from_date, :to_date, :reason, :user_id, :reporting_head_id, :status)
    end
end
