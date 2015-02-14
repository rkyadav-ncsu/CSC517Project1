class ProjectsController < ApplicationController
  include SessionsHelper
  def index
    @projects =Project.all
  end
  def new
      @project = Project.new
  end
  def edit
    @project=Project.find(params[:id])
  end
  def show
    @project=Project.find(params[:id])
    @addDeveloper=[]
    User.all.each do |u|
      if u.project == nil and u.developer?
        @addDeveloper.append([u.name,u.id])
      end
    end

  end
  def create
    @project = Project.new(projects_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      @project=Project.find(params[:id])
      if @project.update(projects_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project=Project.find(params[:id])
    @stories=Story.where(project_id: @project.id)
    if current_user.admin?
      @project.destroy
    end
      respond_to do |format|
        format.html { redirect_to projects_url }
        format.json { head :no_content }
      end
  end
  def addDev
    @project = Project.find(params[:id])
    if(User.find_by_id(params[:user_id]) != nil)
    @user = User.find(params[:user_id])
    @user.project=@project
    @user.save
    end
    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end

  end
  def delDev
    @project = Project.find(params[:id])
    @user = User.find(params[:user_id])
    @user.project=nil
    @user.save
    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end

  private

  def projects_params
    params.require(:project).permit(:name,:description)
  end
end
