class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    #Twitter.configure do |config|
    #  config.consumer_key = "6505998e1514a6dfcce1a185cc2f80e7"
    #  config.consumer_secret = "9599164edea0e25d61d62b83c30d89b5"
    #  config.oauth_token = YOUR_OAUTH_TOKEN
    #  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
    #end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      # Are we re-ranking tasks?
      if params[:task][:rank]
        new_rank = Task.order_by([[:rank, :asc]])[params[:task][:rank].to_i].rank
        @task.rank = new_rank + (new_rank > @task.rank ? 1 : 0)

        # Adjust other ranks to fit task in new rank, can this be more efficient?
        Task.where(:rank.gte => @task.rank).each do |ut|
          ut.rank += 1
          
          if !ut.save
            format.html { render action: "edit" }
            format.json { render json: @task.errors, status: :unprocessable_entity }
          end
        end

        # Save the new rank for the task
        if !@task.save
          format.html { render action: "edit" }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        else
          format.html { redirect_to @task, notice: 'Task was successfully updated.' }
          format.json { head :ok }
        end
      else
        # Normal update, no re-rank
        if @task.update_attributes(params[:task])
          format.html { redirect_to @task, notice: 'Task was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
    end
  end
end
