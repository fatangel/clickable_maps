class ClickableMapsController < ApplicationController

  radiant_layout 'Maps', :only => [ :index_maps, :show_map ]
  no_login_required

  def index_maps
    @states=State.find(:all)
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

  def index_districts
    if params[:id]
      state=State.find_by_short_name(params[:id])
      if state
        @districts=District.find_all_by_state_id(state.id)
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
