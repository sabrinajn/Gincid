class IncidentsController < ApplicationController
  def index
    @incidents = Incident.all
  end

  def show
    @incident = Incident.find(params[:id])
  end

  def new
    @incident = Incident.new
    
  end

  def create
    @incident = Incident.new(params[:incident])
    if @incident.save
      flash[:notice] = "Successfully created incident."
      redirect_to @incident
    else
      render :action => 'new'
    end
  end

  def edit
    @incident = Incident.find(params[:id])
  end

  def update
    @incident = Incident.find(params[:id])
    if @incident.update_attributes(params[:incident])
      flash[:notice] = "Successfully updated incident."
      redirect_to @incident
    else
      render :action => 'edit'
    end
  end

  def destroy
    @incident = Incident.find(params[:id])
    @incident.destroy
    flash[:notice] = "Successfully destroyed incident."
    redirect_to incidents_url
  end
end
