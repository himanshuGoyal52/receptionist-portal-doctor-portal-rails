class DoctorsController < ApplicationController
  def patient_registration_chart
    @doctor = Doctor.find(params[:id])
    @patients_registered_by_day = @doctor.patients.group_by_day(:created_at).count
    render json: @patients_registered_by_day
  end
end
