# frozen_string_literal: true

class DressmakersController < ApplicationController
  before_action :load_dressmaker, only: %i[show update]

  def index
    set_dressmakers
  end

  def new
    @dressmaker = Dressmaker.new
  end

  def show; end

  def create
    @dressmaker = Dressmaker.new(dressmaker_params)

    Dressmakers::CreateDressmaker.new(dressmaker: @dressmaker).call

    flash[:notice] = I18n.t('dressmakers.success_create')
    redirect_to dressmakers_path
  rescue Dressmakers::CreateDressmakerError
    render :new
  end

  def update
    Dressmakers::UpdateDressmaker.new(dressmaker: @dressmaker, attributes: dressmaker_params).call

    flash[:notice] = I18n.t('dressmakers.success_update')
    redirect_to dressmakers_path
  rescue Dressmakers::UpdateDressmakerError
    render :show
  end

  private

  def dressmaker_params
    params.require(:dressmaker).permit(:id, :name, :max_service_quantity, :start_working_date, :end_working_date)
  end

  def set_dressmakers
    result = Dressmakers::ListDressmakers.new.call

    @dressmakers = result[:dressmakers]
    @dressmakers_count = result[:count]
  end

  def load_dressmaker
    @dressmaker ||= Dressmakers::FindDressmaker.new(id: params[:id]).call
  end
end
