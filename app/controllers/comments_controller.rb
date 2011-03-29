class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @todo = Todo.find(params[:todo_id])
  end

  def create
    @todo = Todo.find(params[:todo_id])
    @todo.comments.create params[:comment]
  end

  def destroy
    @todo = Todo.find(params[:todo_id])
    @todo.comments.find(params[:id]).destroy
    #flash[:notice] = 'Removido!'
  end

end
