class ShiftsController < ApplicationController
  def index
    if params[:employee_id]
      # Eğer URL'de employee_id varsa, sadece o çalışanın vardiyalarını getir
      shifts = Shift.where(employee_id: params[:employee_id])
    else
      # Yoksa tüm vardiyaları getir
      shifts = Shift.all
    end

    render json: shifts, include: :employee
  end

  def create
    shift = Shift.new(shift_params)
    if shift.save
      render json: shift, status: :created
    else
      render json: { errors: shift.errors }, status: :unprocessable_entity
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:employee_id, :start_time, :end_time)
  end
end
