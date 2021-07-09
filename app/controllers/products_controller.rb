class ProductsController < ApplicationController
  before_action :authenticate_le!
  def index
    if params[:client_id]
      @client = Client.find_by(id: params[:client_id])
      if @client.nil?
        redirect_to clients_path, alert: "Client not found"
      else
      end
      @products = @client.products
    end
      # respond_to do |format|
      #   format.html  {render :index}
      #   format.json {render json: @client}
      # end
    end


  def show
    if params[:client_id]
      @client = Client.find_by(id: params[:client_id])
      @products = @client.products.find_by(id: params[:id])
      if @products.empty?
        redirect_to client_products_path(@client), alert: "Product not found"
      end
    else
       @product = Product.find_by_id(params[:id])
    end
    # respond_to do |format|
    #   format.html
    #   format.json {render json: @product}
    # end
  end

  def new
    @client = Client.find_by_id(params[:client_id])
    @product = @client.products.build
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    @product.update(product_params)

    if @product.save
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product deleted."
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :client_id)
  end
end
