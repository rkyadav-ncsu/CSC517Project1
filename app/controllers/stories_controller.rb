class StoriesController < ApplicationController
  include SessionsHelper

=begin
  @pointValue=[[1,1],[2,2],[3,3],[4,4]]
  @stageOptions=[["Analysis","Analysis"], ["Ready for Dev","Ready for Dev"],["In Development","In Development"] ,["Development Complete","Development Complete"], ["In Test","In Test"] ,["Complete","Complete"]]
=end

  def index
    @project=Project.find(params[:id])
    @title=params[:title]
    @stories = Story.where(project: @project)
    if(@title!=nil)
      @stories = @stories.search(@title)
    end
    else
    end

  def new
    puts params
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
  def signup_dev1
    respond_to do |format|
    @story = Story.find(params[:id])
    @signup_dev = User.find(params[:signup_dev_id])
    @story.developer1 = @signup_dev
    cleanup_dev_signups(@story.id, 1)
    @story.save
    format.html { redirect_to stories_index_path(:id => @story.project_id), notice: 'Story was successfully updated.' }

    end
  end
  def signup_dev2
    respond_to do |format|
      @story = Story.find(params[:id])
      @signup_dev = User.find(params[:signup_dev_id])
      @story.developer2 = @signup_dev
      cleanup_dev_signups(@story.id, 2)
      @story.save
      format.html { redirect_to stories_index_path(:id => @story.project_id), notice: 'Story was successfully updated.' }
    end
  end
  def cleanup_dev_signups(story_id, num)
    @stories = Story.all
    @stories.each do |story|
      if story.developer1 == current_user and (story.id != story_id or num != 1)
        story.developer1 = nil
      end
      if story.developer2 == current_user and (story.id != story_id or num != 2)
        story.developer2 = nil
      end
      story.save
    end
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
      if isUserDeveloperOnProject?(story_params[:project_id]) && @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        if !(isUserDeveloperOnProject?(story_params[:project_id]))
          format.html { redirect_to stories_path(:id => story_params[:project_id]), notice: 'Failed: You do not have permission to create story.'}
          format.json { render action: 'index',:id=>story_params[:project_id], status: :unprocessable_entity, location: @story }
        else
          format.html { render action: 'new' }
          format.json { render json: @story.errors, status: :unprocessable_entity }
        end

      end
    end
  end
  def update
    respond_to do |format|
      @pointValue=[[1,1],[2,2],[3,3],[4,4]]
      @stageOptions=[["Analysis","Analysis"], ["Ready for Dev","Ready for Dev"],["In Development","In Development"] ,["Development Complete","Development Complete"], ["In Test","In Test"] ,["Complete","Complete"]]
      @story=Story.find(params[:id])

      if isUserDeveloperOnProject?(story_params[:project_id]) && @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        if !(isUserDeveloperOnProject?(story_params[:project_id]))
          format.html { redirect_to stories_path(:id => story_params[:project_id]), notice: 'Failed: You do not have permission to create story.'}
          format.html { redirect_to @story, :id=>story_params[:project_id], notice: :unprocessable_entity }
        else
        format.html { render action: 'edit' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
          end
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @story=Story.find(params[:id])
    @tempProjectId=@story.project.id
    if(isUserDeveloperOnProject?(@tempProjectId))
      @story.destroy
      respond_to do |format|
        format.html { redirect_to stories_path(:id=>@tempProjectId) }
        format.json { head :no_content }
      end
    else
    respond_to do |format|
      format.html{redirect_to stories_path(:id=>@tempProjectId)}
    end
      end
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:project_id, :title, :description, :pointValue,:stage)
  end
  def isUserDeveloperOnProject?(projectid)
    @project=Project.find(projectid)
    @project.developers.each do |developer|
      if(developer.name==current_user.name)
        puts developer.name
        puts current_user.name
        return true
      end
    end
    return false
  end
end

