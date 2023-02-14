class EmployeesController < ApplicationController
    skip_before_action :configure_permitted_parameters

    def new
        @employee=Employee.new
        @pictures=@employee.pictures.build
    end

    private

    def employee_params
        params.require(:employee).permit(:name,pictures_attributes: [:id,:name,:_destroy])
    end
end