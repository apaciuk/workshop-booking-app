class WorkshopsController < ApplicationController
    before_action :set_workshop, only: [:show, :edit, :update, :destroy]

    def index 
        @workshops = Workshop.all
    end 

    def show 
        @workshop = Workshop.find(params[:id])
    end

    def new 
        @workshop = Workshop.new
    end 

    def create 
        @workshop = Workshop.new(workshop_params)
        if @workshop.save
            redirect_to workshops_path
        else
            render :new
        end 
    end 

    def edit 
        @workshop = Workshop.find(params[:id])
    end 

    def update 
        @workshop = Workshop.find(params[:id])
        if @workshop.update(workshop_params)
            redirect_to workshops_path
        else
            render :edit
        end 
    end 

    def destroy 
        @workshop = Workshop.find(params[:id])
        @workshop.destroy
        redirect_to workshops_path
    end

    private

    def workshop_params 
        params.require(:workshop).permit(:name, :description, :start_date, :end_date, :start_time, :end_time, :total_sits, :remaining_sits, :registration_fee)
    end

    def set_workshop 
        @workshop = Workshop.find(params[:id])
    end

end
