class ClickableMapsController < ApplicationController
 
  radiant_layout 'maps', :only => [ :index_maps, :show_map ]
  no_login_required
  skip_before_filter :verify_authenticity_token
  
  def create
    @page = Page.find(params[:page_id])
    make_and_send_pdf(CGI::escape(@page.title), :html_string => @page.render, :stylesheets => params[:cssfile])
  end
               
  def index_maps
    @title="Österreich"
    @states=State.find(:all, :order => "name DESC")
    if @states
      respond_to do |format|
        format.html
        format.xml { render :xml => @states }
      end
    end
  end

  def show_map
    if params[:id]
      @state=State.find_by_short_name(params[:id])
      if @state
        respond_to do |format|
          format.html
          format.xml { render :xml => @state }
        end
      end
    end
  end

  def districts_list
    @districts=District.find_all_by_state_id(params[:state][:id], :conditions => "position_x IS NOT NULL") if params[:state][:id]
    respond_to do |format|
      format.html { redirect_to all_maps_path }
      format.js
    end
  end

  def index_districts
    if params[:id]
      state=State.find_by_short_name(params[:id])
      if state
        @districts=District.find_all_by_state_id(state.id, :conditions => "position_x IS NOT NULL")
        if @districts
          respond_to do |format|
            format.html
            format.xml { render :xml => @districts }
          end
        end
      end
    end
  end

end
