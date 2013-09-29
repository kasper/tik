class TasksController < ApplicationController

  before_filter :ensure_that_logged_in, :except => [ :index, :show ]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new

    @task = Task.new
    @users = User.all

  end

  # GET /tasks/1/edit
  def edit

    @users = User.all
    @tag_names = @task.tags.join(', ')

  end

  # POST /tasks
  # POST /tasks.json
  def create

    @task = Task.new(task_params)
    @users = User.all

    @task.creator = current_user

    respond_to do |format|

      if @task.save

        # Tags
        @task.tags << tags(params[:tags])
        @task.save

        format.html { redirect_to(tasks_path) }
        format.json { render action: 'show', status: :created, location: @task }

      else

        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }

      end

    end

  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update

    @users = User.all

    respond_to do |format|

      if @task.update(task_params)

        # Tags
        @task.taggings.destroy_all
        @task.tags << tags(params[:tags])
        @task.save

        format.html { redirect_to(tasks_path) }
        format.json { head :no_content }

      else

        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }

      end

    end

  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy

    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :completed, :owner_id)
    end

    def tags(tag_names)

      # Tags
      tags = []

      tag_names.split(',').each do |tag_name|

        tag_name = tag_name.strip.downcase.gsub(' ', '-')
        tag = Tag.find_by_name(tag_name)

        tag = Tag.create(:name => tag_name) unless tag
        tags << tag unless tags.include?(tag)

      end

      return tags

    end

end
