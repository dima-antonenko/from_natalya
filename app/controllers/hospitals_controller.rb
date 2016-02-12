class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :remove_doctor]


  def index
    @hospitals = Hospital.all
  end

  def edit
  end

  def update
    notice = SHospital::Update.new(@hospital, params).main
    respond_to do |format|
      if @hospital.save
        format.html { redirect_to :back, notice: notice }
      end
    end
  end

  def remove_doctor
    notice = SHospital::RemoveDoctor.new(@hospital, params).main
    respond_to do |format|
      if @hospital.save
        format.html { redirect_to :back, notice: notice }
      end
    end
  end


  private


  def set_hospital
    @hospital = HospitalDecorator.decorate(Hospital.find(params[:id]))
  end

end
