class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize

    def index
        @users = User.all
    end

    def update
        user = User.find(params[:id])
        user.roles = []
        user.add_role(:admin)
        redirect_to '/admin'
    end

    private

    def authorize
        if !current_user.has_role? :admin
            render plain:"No access for you!"
        end
    end
end
