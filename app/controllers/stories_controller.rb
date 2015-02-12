class StoriesController < ApplicationController
  include SessionsHelper

=begin
  @pointValue=[[1,1],[2,2],[3,3],[4,4]]
  @stageOptions=[["Analysis","Analysis"], ["Ready for Dev","Ready for Dev"],["In Development","In Development"] ,["Development Complete","Development Complete"], ["In Test","In Test"] ,["Complete","Complete"]]
=end

  def index
    @project=Project.find(params[:id])
    puts @project
    puts @project.name
    @stories =Story.where(project_id = @project.id)
  end
  def new
    puts params
    @project=Project.find(params[:id])
    #TODO Set developers
    #@developer1 = User.find_by name: params[]
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
    puts story_params
    story_params[:project] = Project.find(story_params[:project_id])
    story_params[:developer1] = User.find_by id: story_params[:developer1_id]
    story_params[:developer2] = User.find_by id: story_params[:developer2_id]
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
    @story=Story.find(params[:id])
    @tempProjectId=@story.project.id
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_path(:id=>@tempProjectId) }
      format.json { head :no_content }
    end
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:project_id, :title, :description, :developer1_id, :developer2_id)
  end
end

