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
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private

  def projects_params
    params.require(:project).permit(:name,:description)
  end
end
