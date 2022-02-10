class TranzactionsController < ApplicationController
  before_action :set_tranzaction, only: %i[show edit update destroy]

  def show; end

  def new
    @tranzaction = Tranzaction.new
  end

  def edit; end

  def create
    @tranzaction = Tranzaction.new(tranzaction_params)
    @tranzaction.user_id = current_user.id
    @tranzaction.save!
    @full_tran = @tranzaction.categories_tranzactions.create!(category_id: params[:category_id])
    @adding_to_cat = Category.find(@full_tran.category_id)
    @adding_to_cat.total += @tranzaction.amount
    respond_to do |format|
      if @full_tran.save
        format.html do
          @adding_to_cat.save
          redirect_to category_url(@full_tran.category_id),
                      notice: 'Tranzaction was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tranzaction.categories_tranzactions.find(params[:id]).destroy
    @tranzaction.destroy
    respond_to do |format|
      format.html { redirect_to category_url(params[:category_id]), notice: 'Tranzaction was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tranzaction
    @tranzaction = Tranzaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tranzaction_params
    params.require(:tranzaction).permit(:name, :amount)
  end
end
