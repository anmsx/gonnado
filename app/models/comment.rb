class Comment
  include Mongoid::Document
  
  field :message
  
  embedded_in :todo, :inverse_of => :comments
end
