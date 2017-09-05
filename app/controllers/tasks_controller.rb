class TasksController < ApplicationController
before_action :set_list
before_action :set_task, except: [:create, :new]
def show
  @tasks= @list.tasks.find(task_params[:id])
end

def create
  @task= @list.tasks.create(task_params)
      respond_to do |format|
        if @list.save
          format.html { redirect_to @list, notice: 'was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end

end

def new
  @task = @list.tasks.new
end

  def destroy
    if @task.destroy
    flash[:success] = "New task removed."
    else
      flash[:error] = "Unable to remove item at this time."
    end
      redirect_to @list
  end


  def update
    @list= List.find(params[:list_id])
    @task= @list.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to list_path(@list)
    else
      render 'edit'
    #   format.html { redirect_to @list, notice: 'Task was successfully updated.' }
    #   format.json { render :show, status: :ok, location: @list }
    # else
    #   format.html { render :edit }
    #   format.json { render json: @list.errors, status: :unprocessable_entity }
    end
  end


def edit
   @task = @list.tasks.find(params[:id])
 end

 def task_params
   params[:task].permit(:title, :content, :completed, :due_date,:list_id, )
 end


def complete
  if @task.completed== false
    @task.update_attribute(:completed, true)
  else @task.update_attribute(:completed, false)
  end
 redirect_to @list
end

private
  def set_list
    @list= List.find(params[:list_id])
  end
  def set_task
    @task= @list.tasks.find(params[:id])
  end

end
