class ReceptionistsController < ApplicationController
  before_action :require_login

  def index
    @receptionists = Receptionist.all
  end

  def show
    @receptionist = Receptionist.find(params[:id])
  end

  def new
    @receptionist = Receptionist.new
  end

  def create
    @receptionist = Receptionist.new(receptionist_params)
    if @receptionist.save
      redirect_to @receptionist, notice: 'Receptionist was successfully created.'
    else
      render :new
    end
  end

  def edit
    @receptionist = Receptionist.find(params[:id])
  end

  def update
    @receptionist = Receptionist.find(params[:id])
    if @receptionist.update(receptionist_params)
      redirect_to @receptionist, notice: 'Receptionist was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @receptionist = Receptionist.find(params[:id])
    @receptionist.destroy
    redirect_to receptionists_url, notice: 'Receptionist was successfully destroyed.'
  end

  private

  def receptionist_params
    params.require(:receptionist).permit(:name, :email, :password, :password_confirmation)
  end
end
