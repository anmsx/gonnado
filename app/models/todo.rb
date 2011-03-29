class Todo
  include Mongoid::Document

  OPEN = 'OPEN'
  DOING = 'DOING'
  FINISHED = 'FINISHED'

  field :title
  field :description
  field :status

  embeds_many :comments

  def finished?
    status == FINISHED
  end
  
  def finish
    write_attribute :status, FINISHED
    save
  end

  def Todo.find_today_list
    Todo.all
  end
end
