class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize

    def index
        @users = User.all
    end

    def update
        user = User.find(params[:id])
        if user.has_role?(:creator)
            user.roles = []
            user.add_role(:admin)
        elsif user.has_role?(:admin) || user.has_role?(:viewer)
            user.roles = []
            user.add_role(:creator)
        end
        redirect_to '/admin'
    end

    private

    def authorize
        if !current_user.has_role? :admin
            render plain:"No access for you!"
        end
    end
end
