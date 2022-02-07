class TransController < ApplicationController
  before_action :set_tran, only: %i[show edit update destroy]

  def index
    @trans = Tran.all
  end

  def show; end

  def new
    @tran = Tran.new
  end

  def edit; end

  def create
    @tran = Tran.new(tran_params)
    @tran.user_id = current_user.id
    @tran.category_id = params[:category_id]
    respond_to do |format|
      if @tran.save
        format.html { redirect_to tran_url(@tran), notice: 'Tran was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tran.update(tran_params)
        format.html { redirect_to tran_url(@tran), notice: 'Tran was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tran.destroy

    respond_to do |format|
      format.html { redirect_to trans_url, notice: 'Tran was successfully destroyed.' }
    end
  end

  private

  def set_tran
    @tran = Tran.find(params[:id])
  end

  def tran_params
    params.require(:tran).permit(:name, :amount)
  end
end
