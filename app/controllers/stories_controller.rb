class StoriesController < ApplicationController
  include SessionsHelper

  @pointValue=[[1,1],[2,2],[3,3],[4,4]]
  @stageOptions=[["Analysis","Analysis"], ["Ready for Dev","Ready for Dev"],["In Development","In Development"] ,["Development Complete","Development Complete"], ["In Test","In Test"] ,["Complete","Complete"]]

  def index
    @project=Project.find(params[:id])
    @stories =Story.where(project_id = @project.id)
  end
  def new
    @project=Project.find(params[:id])
    @pointValue=[[1,1],[2,2],[3,3],[4,4]]
    @stageOptions=[["Analysis","Analysis"], ["Ready for Dev","Ready for Dev"],["In Development","In Development"] ,["Development Complete","Development Complete"], ["In Test","In Test"] ,["Complete","Complete"]]
    @story = Story.new
    @story.project=@project
  end
  def edit
    @pointValue=[[1,1],[2,2],[3,3],[4,4]]
    @stageOptions=[["Analysis","Analysis"], ["Ready for Dev","Ready for Dev"],["In Development","In Development"] ,["Development Complete","Development Complete"], ["In Test","In Test"] ,["Complete","Complete"]]
    @story=Story.find(params[:id])
    @project=@story.project
  end
  def show
    @story=Story.find(params[:id])
  end
  def create
    @pointValue=[[1,1],[2,2],[3,3],[4,4]]
    @stageOptions=[["Analysis","Analysis"], ["Ready for Dev","Ready for Dev"],["In Development","In Development"] ,["Development Complete","Development Complete"], ["In Test","In Test"] ,["Complete","Complete"]]
    @story = Story.new(story_params)
    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      @pointValue=[[1,1],[2,2],[3,3],[4,4]]
      @stageOptions=[["Analysis","Analysis"], ["Ready for Dev","Ready for Dev"],["In Development","In Development"] ,["Development Complete","Development Complete"], ["In Test","In Test"] ,["Complete","Complete"]]
      @story=Story.find(params[:id])

      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_path }
      format.json { head :no_content }
    end
  end

  private

  def story_params
    params.require(:story).permit(:title,:project)
  end
end

