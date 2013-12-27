class PomodorosController < ApplicationController
  # GET /pomodoros
  # GET /pomodoros.json
  def index
    @pomodoros = Pomodoro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pomodoros }
    end
  end

  # GET /pomodoros/1
  # GET /pomodoros/1.json
  def show
    @pomodoro = Pomodoro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pomodoro }
    end
  end

  # GET /pomodoros/new
  # GET /pomodoros/new.json
  def new
    @pomodoro = Pomodoro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pomodoro }
    end
  end

  # GET /pomodoros/1/edit
  def edit
    @pomodoro = Pomodoro.find(params[:id])
  end

  # POST /pomodoros
  # POST /pomodoros.json
  def create
    @pomodoro = Pomodoro.new(params[:pomodoro])

    respond_to do |format|
      if @pomodoro.save
        format.html { redirect_to @pomodoro, notice: 'Pomodoro was successfully created.' }
        format.json { render json: @pomodoro, status: :created, location: @pomodoro }
      else
        format.html { render action: "new" }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pomodoros/1
  # PUT /pomodoros/1.json
  def update
    @pomodoro = Pomodoro.find(params[:id])

    respond_to do |format|
      if @pomodoro.update_attributes(params[:pomodoro])
        format.html { redirect_to @pomodoro, notice: 'Pomodoro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pomodoros/1
  # DELETE /pomodoros/1.json
  def destroy
    @pomodoro = Pomodoro.find(params[:id])
    @pomodoro.destroy

    respond_to do |format|
      format.html { redirect_to pomodoros_url }
      format.json { head :no_content }
    end
  end

  #group_by
  def group
    group_by = "group_by_#{params[:length]}"
    grouped_data = Pomodoro.send(group_by.to_sym, :created_at).count
    respond_to do |format|
      format.html
      format.json { render json: grouped_data.to_json, :callback => params['callback'] }
    end
  end
end








