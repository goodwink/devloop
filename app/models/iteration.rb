class Iteration
  include Mongoid::Document
  field :name, :type => String
  field :slug, :type => String
  field :start_date, :type => Date
  field :end_date, :type => Date
  field :statusnet_topic, :type => String
  field :rank, :type => Integer

  belongs_to :version
  has_many :tasks
end
