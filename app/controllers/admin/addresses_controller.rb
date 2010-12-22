class Admin::AddressesController < ApplicationController
  
  def index
    @addresses = Address.paginate :per_page => 25, :page => params[:page], :order => 'name' unless params[:order]
    @addresses = Address.paginate :per_page => 25, :page => params[:page], :order => params[:order] if params[:order]
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:address])
    if @address.save
      flash[:notice] = 'Die Adresse wurde erfolgreich angelegt.'
      redirect_to admin_address_url
    else
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(params[:address])
      redirect_to admin_address_url
    else
      render :edit
    end
  end
	
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to admin_address_url
  end
  
end