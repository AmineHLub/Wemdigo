class TranzactionsController < ApplicationController
  before_action :set_tranzaction, only: %i[show edit update destroy]

  def index
    @tranzactions = Tranzaction.all
  end

  def show; end

  def new
    @tranzaction = Tranzaction.new
  end

  def edit; end

  def create
    @tranzaction = Tranzaction.new(tranzaction_params)

    respond_to do |format|
      if @tranzaction.save
        format.html { redirect_to tranzaction_url(@tranzaction), notice: 'Tranzaction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tranzaction.update(tranzaction_params)
        format.html { redirect_to tranzaction_url(@tranzaction), notice: 'Tranzaction was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tranzaction.destroy

    respond_to do |format|
      format.html { redirect_to tranzactions_url, notice: 'Tranzaction was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tranzaction
    @tranzaction = Tranzaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tranzaction_params
    params.require(:tranzaction).permit(:name, :amount, :category_id, :splash_id)
  end
end
