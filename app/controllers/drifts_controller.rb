class DriftsController < ApplicationController
  require 'rest_client'
  before_action :set_drift, only: [:show, :update, :destroy]
  # GET /drifts
  # GET /drifts.json
  def index
    @drifts = Drift.all
    render json: @drifts
  end
  ##28.677031,77.501339 (lat,long)
  # GET /drifts/1
  # GET /drifts/1.json
  def show
    render json: @drift
  end

  # POST /drifts
  # POST /drifts.json
  def create
    @drift = Drift.new(drift_params)
    if @drift.save
      render json: @drift, status: :created, location: @drift
    else
      render json: @drift.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drifts/1
  # PATCH/PUT /drifts/1.json
  def update
    @drift = Drift.find(params[:id])

    if @drift.update(drift_params)
      head :no_content
    else
      render json: @drift.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drifts/1
  # DELETE /drifts/1.json
  def destroy
    @drift.destroy

    head :no_content
  end

  private

    def set_drift
      @drift = Drift.find(params[:id])
    end

    def drift_params
      params.require(:drift).permit(:longitude, :latitude)
    end
end
