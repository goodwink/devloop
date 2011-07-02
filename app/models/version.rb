class Version
  include Mongoid::Document
  field :name, :type => String
  field :slug, :type => String
  field :release_date, :type => Date
  field :statusnet_topic, :type => String
  field :rank, :type => Integer

  belongs_to :project
  has_many :iterations
  has_many :tasks
end
