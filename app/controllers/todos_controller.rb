class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = find_todos
  end 

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new params[:todo]
    @todo.status = Todo::OPEN
    if @todo.save
      redirect_to todos_url, :notice => 'Ok, vai fazer.'
    else
      redirect_to todos_url, :alert => 'Ops, ocorreu um erro.'
    end
  end

  def finish
    @todo = Todo.find params[:id]
    @todo.finish
    redirect_to todos_url, :notice => 'Ok, finalizado.'
  end

  def twits
    @twits = find_twits.shuffle.slice(0, 10)
  end

  def destroy
    @todo = Todo.find params[:id]
    @todo.destroy
    redirect_to(todos_url, :notice => 'Removido!')
  end
  
  def show
    @todo = Todo.find params[:id]
  end
  
  private
    def find_todos
      Todo.find_today_list
    end
    
    def find_twits
      list = Array.new
      find_todos.each do |t|
        next if t.finished?
        Twit.search(t.title).each do |l|
          list.push(l)
        end
      end
      list
    end
end
