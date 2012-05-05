class TodosController < ApplicationController
  before_filter :authenticate_user!
  # GET /todos
  # GET /todos.json
  def index
    @todos = current_user.todos.where("status == ?", true).page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  def completed
    @todos = current_user.todos.where("status == ?", false).page(params[:page]).per(5)

    render 'index'
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = current_user.todos.find(params[:id])
    @notes = @todo.notes.all
    @note = @todo.notes.build

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @todo = current_user.todos.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = current_user.todos.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = current_user.todos.new(params[:todo])

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.html { 
          flash[:alert] = 'Something went wrong trying to save the TODO' 
          render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @todo = current_user.todos.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :ok }
    end
  end
end
