class ClientsController < ApplicationController
    before_action :authenticate_le!

  def index
    @clients = current_le.clients.uniq
    respond_to do |format|
      format.html
      format.json {render json: @clients}
    end
  end

  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html  {render :show}
      format.json {render json: @client}
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    current_le.clients << @client
    if @client.save
      # redirect_to client_products_path(@client)
      render json: @client, status: 201
    else
      render :new
    end
    # respond_to do |format|
    #   format.html
    #   format.json {render json: @client}
    # end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end


  # def
  #  all.order(name: :asc)
  # end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :age, :name)
  end
end
