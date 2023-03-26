class LeasesController < ApplicationController

    def create
        lease = Lease.create!(lease_params)
        if lease
            render json: lease, status: :created
        else
            render json: {error: lease.errors.full_messages}, status: 422
        end
    end
    
    def destroy
        lease =  Lease.find(params[:id])
        if lease
            lease.destroy
            head :no_content
        else
            render json: {error: "Lease not found"}, status: :not_found
        end
    end

    private

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

end
