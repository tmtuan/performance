class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all.order("Created_at DESC")
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit'
    end

  end

  def destroy
    if @employee.destroy
      redirect_to employees_path
    else
      redirect_to @employee
    end

  end

  private

    def employee_params
      params.require(:employee).permit(:name, :description)
    end

    def find_employee
      @employee = Employee.find(params[:id])
    end
end
