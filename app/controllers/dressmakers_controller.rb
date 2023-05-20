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
  rescue Dressmakers::CreateDressmakerError => e
    flash[:error] = e.message
    render :new
  end

  def update
    Dressmakers::UpdateDressmaker.new(dressmaker: @dressmaker, attributes: dressmaker_params).call

    flash[:notice] = I18n.t('dressmakers.success_update')
    redirect_to dressmaker_path(@dressmaker)
  rescue Dressmakers::UpdateDressmakerError => e
    flash[:error] = e.message
    render :show
  end

  def destroy
    Dressmakers::DeleteDressmaker.new(id: params[:id]).call

    flash[:notice] = I18n.t('dressmakers.success_destroy')

    redirect_to dressmakers_path
  rescue Dressmakers::DeleteDressmakerError => e
    flash[:error] = e.message
    redirect_to dressmakers_path
  end

  private

  def dressmaker_params
    params.require(:dressmaker).permit(:id, :name, :max_service_quantity, :start_working_date, :end_working_date)
  end

  def set_dressmakers
    @activated = params[:activated].nil? ? true : params[:activated] == 'true'

    result = Dressmakers::ListDressmakers.new(activated: @activated).call

    @dressmakers = result[:dressmakers]
    @dressmakers_count = result[:count]
  end

  def load_dressmaker
    @dressmaker ||= Dressmakers::FindDressmaker.new(id: params[:id]).call
  end
end
