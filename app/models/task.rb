class Task
  include Mongoid::Document
  field :number, :type => Integer
  field :name, :type => String
  field :description, :type => String
  field :estimate, :type => Integer
  field :statusnet_topic, :type => String
  field :rank, :type => Integer
  field :phase, :type => String

  belongs_to :iteration
  belongs_to :version
  belongs_to :project
  
  before_save :default_values
  
  def default_values
    self.number = Task.max(:number).to_i + 1 if !self.number
    self.rank = Task.max(:rank).to_i + 1 if !self.rank
  end
end
