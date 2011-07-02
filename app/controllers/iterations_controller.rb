class IterationsController < ApplicationController
  # GET /iterations
  # GET /iterations.json
  def index
    @iterations = Iteration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iterations }
    end
  end

  # GET /iterations/1
  # GET /iterations/1.json
  def show
    @iteration = Iteration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iteration }
    end
  end

  # GET /iterations/new
  # GET /iterations/new.json
  def new
    @iteration = Iteration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iteration }
    end
  end

  # GET /iterations/1/edit
  def edit
    @iteration = Iteration.find(params[:id])
  end

  # POST /iterations
  # POST /iterations.json
  def create
    @iteration = Iteration.new(params[:iteration])

    respond_to do |format|
      if @iteration.save
        format.html { redirect_to @iteration, notice: 'Iteration was successfully created.' }
        format.json { render json: @iteration, status: :created, location: @iteration }
      else
        format.html { render action: "new" }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iterations/1
  # PUT /iterations/1.json
  def update
    @iteration = Iteration.find(params[:id])

    respond_to do |format|
      if @iteration.update_attributes(params[:iteration])
        format.html { redirect_to @iteration, notice: 'Iteration was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iterations/1
  # DELETE /iterations/1.json
  def destroy
    @iteration = Iteration.find(params[:id])
    @iteration.destroy

    respond_to do |format|
      format.html { redirect_to iterations_url }
      format.json { head :ok }
    end
  end
end
