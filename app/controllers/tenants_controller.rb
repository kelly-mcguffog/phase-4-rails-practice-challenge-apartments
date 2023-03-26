class TenantsController < ApplicationController
    def index
        render json: Tenant.all, status: :ok
    end

    def create
        tenant = Tenant.create!(tenant_params)
        if tenant
            render json: tenant, status: :created
        else
            render json: {error: tenant.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        tenant = find_tenant
        if tenant
            tenant.update!(tenant_params)
            render json: tenant, status: :accepted
        else
            render json: {error: "Tenant not fount"}, status: 404
        end
    end

    def destroy
        tenant = find_apartment
        tenant.destroy
        head :no_content
    end

    private

    def find_tenant
        Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end
end
