class VotedownsController < ApplicationController

    def create
        votedown = Votedown.create(votedown_params)
        render json: votedown
    end

    def destroy
        votedown = Votedown.find_by(id: params[:id])
        votedown.destroy
        render json: votedown
    end

    def votedown_params
        params.permit(:movie_id)
    end
end
