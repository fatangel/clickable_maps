class ClickableMapsController < ApplicationController

  radiant_layout 'Maps', :only => [ :show_maps ]
  no_login_required

  def show_maps
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
