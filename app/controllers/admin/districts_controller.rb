class Admin::DistrictsController < ApplicationController
  
  def index
    @districts = District.paginate :per_page => 25, :page => params[:page], :order => 'name' unless params[:order]
    @districts = District.paginate :per_page => 25, :page => params[:page], :order => params[:order] if params[:order]
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(params[:district])
    if @district.save
      flash[:notice] = 'Der Bezirk wurde erfolgreich angelegt.'
      redirect_to admin_clickable_maps_url
    else
      render :new
    end
  end

  def edit
    @district = District.find(params[:id])
  end

  def update
    @district = District.find(params[:id])
    if @district.update_attributes(params[:district])
      redirect_to admin_clickable_maps_url
    else
      render :edit
    end
  end
	
  def destroy
    @district = District.find(params[:id])
    @district.destroy
    redirect_to admin_clickable_maps_url
  end
  
end