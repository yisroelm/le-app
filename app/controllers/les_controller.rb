class LesController < ApplicationController
  # def index
  #   @les = Le.all
  # end
  #
  # def show
  #   @le = Le.find(params[:id])
  # end
  #
  # def new
  #   @le = Le.new
  # end
  #
  # def create
  #   @le = Le.new(le_params)
  #
  #   if @le.save
  #     redirect_to le_products_path(@le)
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @le = Le.find(params[:id])
  #   redirect_to le_path(@le)
  # end
  #
  # def update
  #   @le = Le.find(params[:id])
  #
  #   @le.update(le_params)
  #
  #   if @le.save
  #     redirect_to @le
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @le = Le.find(params[:id])
  #   @le.destroy
  #   redirect_to les_path
  # end
  #
  # private
  #
  # def le_params
  #   params.require(:le).permit(:first_name, :last_name)
  # end
end
