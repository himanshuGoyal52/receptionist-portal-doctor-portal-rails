class PatientsController < ApplicationController
    before_action :require_login
  
    def index
      @patients = Patient.all
    end
  
    # Other CRUD actions...
  
  end