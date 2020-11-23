class VoteupsController < ApplicationController

    def create
        voteup = Voteup.create(voteup_params)
        render json: voteup
    end

    def destroy
        voteup = Voteup.find_by(id: params[:id])
        voteup.destroy
        render json: voteup
    end

    def voteup_params
        params.permit(:movie_id)
    end
end
