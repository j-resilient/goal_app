class GoalsController < ApplicationController
    def show
        @goal = Goal.find_by(id: params[:id])
        render :show
    end
    
    def new
        render :new
    end

    def create
        goal = Goal.new(goal_params)
        goal.user_id = current_user.id

        if goal.save
            flash.now[:goal] = "saved!"
            redirect_to goal_url(goal)
        else
            flash.now[:errors] = goal.errors.full_messages
            render :new
        end
    end

    private
    def goal_params
        params.require(:goal).permit(:title, :details, :private, :completed)
    end
end