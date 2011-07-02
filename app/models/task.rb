class Task
  include Mongoid::Document
  field :number, :type => Integer
  field :name, :type => String
  field :description, :type => String
  field :estimate, :type => Integer
  field :statusnet_topic, :type => String
  field :rank, :type => Integer

  belongs_to :iteration
  belongs_to :version
  belongs_to :project
end
