class Api::V1::EmployeesController < Api::V1::BaseController

    skip_before_action :configure_permitted_parameters
    skip_before_action :authentic_employee, only: %i[login new] 
 
    def index
        @employees=Employee.all
        render json: @employees
    end

    def login
        @employee=Employee.find_by(name:params[:name].presence)
        render json: {error: 'unauthorized'} unless @employee
        token=jwt_encode(id: @employee.id)
        render json: {employee: @employee,tokon: token}
    end
end