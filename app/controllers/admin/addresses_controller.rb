class Admin::AddressesController < ApplicationController
  
  #  only_allow_access_to :index,  :new, :create, :edit, :update, :remove, :destroy,
#    :if => :condition?, :when => :admin,
#    :denied_url => { :controller => 'admin/pages', :action => 'index' },
#    :denied_message => 'Sie müssen Administratorrechte besitzen um die Aktion durchzuführen.'
#
#  def condition?
#  # wie komm ich zur aktuellen site_id?
#    (self.current_site.id==2) ? false : true
#  end

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