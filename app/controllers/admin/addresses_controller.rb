class Admin::AddressesController < ApplicationController
  
  def index
    order=params[:order] || "district_id"
    @addresses = Address.paginate :per_page => 25, :page => params[:page], :order => order
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:address])
    if @address.save
      flash[:notice] = 'Die Adresse wurde erfolgreich angelegt.'
      redirect_to admin_addresses_url
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
      redirect_to admin_addresses_url
    else
      render :edit
    end
  end
	
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to admin_addresses_url
  end
  
end