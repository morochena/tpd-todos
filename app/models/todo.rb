class Todo
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :completed, type: Mongoid::Boolean

  validates :title, presence: true 
  validates :completed, presence: true
end
