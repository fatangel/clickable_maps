class Admin::DistrictsController < ApplicationController
  
  def index
    order=params[:order]||'name'
    @districts = District.paginate :per_page => 25, :page => params[:page], :order => order
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(params[:district])
    if @district.save
      flash[:notice] = 'Der Bezirk wurde erfolgreich angelegt.'
      redirect_to admin_districts_url
    else
      render :new
    end
  end

  def edit
    @district = District.find(params[:id])
  end

  def generate_page
    if params[:id].eql?("0") # generate all pages
      @districts = District.find(:all)
      for one_district in @districts do
        unless one_district.address.nil?
          create_page(one_district)
        end
      end
      flash[:notice]="Alle Seiten wurde erfolgreich neu erstellt."
    else
      @district = District.find(params[:id])
      if @district.address
        create_page(@district)
        flash[:notice]="Die Seite wurde erfolgreich neu erstellt."
      else
        flash[:error]="Für diesen Bezirk existieren keine Adressdaten."
      end
    end
    redirect_to admin_districts_url
  end
  
  def update
    @district = District.find(params[:id])
    if @district.update_attributes(params[:district])
      redirect_to admin_districts_url
    else
      render :edit
    end
  end
	
  def destroy
    @district = District.find(params[:id])
    @district.destroy
    redirect_to admin_districts_url
  end
  
  private
  
  def create_page(district)
   
    page_content="h3. "+district.address.behoerde+"\r\nAbteilung: "+district.address.abteilung+"\r\n"+district.address.adresse+"\r\n"
    page_content+="\r\np. &nbsp;\r\nBeamtIn: "+district.address.name+"\r\nTelefon: "+district.address.telefon+"\r\nE-Mail: "+district.address.email+"\r\nWebseite: "
    page_content+="\"hier klicken\":"+district.address.url+"\r\nSonstiges: "+district.address.sonstiges
    @page=Page.find_by_slug(district.short_name)
    unless @page.nil? # page exists - overwrite content only
      @page.slug=district.short_name
      @page.title=district.name
      @page.breadcrumb=district.name
      @page.parent_id=436
      @page.site_id=4 # 4 für partnerschaftsgesetz.at      
      @page.parts(:conditions=>{:name=>"body"}).first.content=page_content
      @page.save!
    else
      @page=Page.new
      @body_part=PagePart.new
      @body_part.content=page_content
      @body_part.name="body"
      @body_part.filter_id="Textile"

      @page.slug=district.short_name
      @page.title=district.name
      @page.parent_id=436
      @page.site_id=4 # 4 für partnerschaftsgesetz.at
      @page.status_id=90
      @page.class_name=""
      @page.published_at=Date.today
      @page.breadcrumb=district.name        
      @page.save!
      @body_part.page_id=@page.id
      @body_part.save!          
    end   
 
  end
  
end