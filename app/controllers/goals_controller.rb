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
            flash[:goal] = "Goal saved!"
            redirect_to goal_url(goal)
        else
            flash.now[:errors] = goal.errors.full_messages
            render :new
        end
    end

    def edit
        @goal = Goal.find_by(id: params[:id])
        render :edit
    end
    
    def update
        @goal = Goal.find_by(id: params[:id])

        if @goal.update(goal_params)
            flash[:goal] = "Goal successfully edited!"
            redirect_to goal_url(@goal)
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :edit
        end
    end

    def destroy
        goal = Goal.find_by(id: params[:id])
        user = User.find_by(id: goal.user_id)
        goal.destroy
        redirect_to user_url(user)
    end

    private
    def goal_params
        params.require(:goal).permit(:title, :details, :private, :completed)
    end
end