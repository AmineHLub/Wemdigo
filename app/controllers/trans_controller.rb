class TransController < ApplicationController
  before_action :set_tran, only: %i[ show edit update destroy ]

  def index
    @trans = Tran.all
  end

  def show
  end

  def new
    @tran = Tran.new
  end

  def edit
  end

  def create
    @tran = Tran.new(tran_params)

    respond_to do |format|
      if @tran.save
        format.html { redirect_to tran_url(@tran), notice: "Tran was successfully created." }
        format.json { render :show, status: :created, location: @tran }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tran.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tran.update(tran_params)
        format.html { redirect_to tran_url(@tran), notice: "Tran was successfully updated." }
        format.json { render :show, status: :ok, location: @tran }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tran.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tran.destroy

    respond_to do |format|
      format.html { redirect_to trans_url, notice: "Tran was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_tran
      @tran = Tran.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tran_params
      params.require(:tran).permit(:name, :amount)
    end
end
