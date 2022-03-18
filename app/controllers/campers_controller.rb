class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_camper_not_found
    # GET /campers/:id
    def show
        camper = find_camper
        render json: camper, serializer: CamperShowSerializer
    end

    # GET /campers
    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    # POST /campers
    def create
        new_camper = Camper.create!(camper_params)
        render json: new_camper, status: :created
    end

    private
    def camper_params
        params.require(:camper).permit(:name, :age)
    end

    def find_camper
        Camper.find(params[:id])
    end

    def render_camper_not_found
        render json: {error: "Camper not Found"}, status: :not_found
    end

end
