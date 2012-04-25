class NotesController < ApplicationController
  def create
    @todo = Todo.find(params[:todo_id])
    @note = @todo.notes.build(params[:note])

    if @note.save
      redirect_to todo_path(@todo)
    else
      redirect_to todo_path(@todo)
    end
  end

end
