class Task
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :estimate, :type => Integer
end
