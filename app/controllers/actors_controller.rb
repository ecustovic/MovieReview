class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]
  before_action :reject_if_not_admin

  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
    @actor = Actor.new
  end

  def edit
  end

  def create
    @actor = Actor.new(actor_params)

    respond_to do |format|
      if @actor.save
        format.html {redirect_to actors_path, notice: "Actor was successfully created."}
      else
        format.html {redirect_to actors_path, notice: "Actor failed to save."}
      end
    end
  end

  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html {redirect_to actors_path, notice: "Actor was successfully updated."}
      else
        format.html {redirect_to actors_path, notice: "Actor's update failed to be saved."}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @actor.destroy
        format.html {redirect_to actors_path, notice: "Actor was successfully destroyed."}
      end
    end
  end

  private
    def set_actor
      @actor = Actor.find(params[:id])
    end

    def actor_params
      params.require(:actor).permit(:name, :image, :birth_date, :gender)
    end

    def reject_if_not_admin
      redirect_to root_path unless current_user.admin?
    end
end
