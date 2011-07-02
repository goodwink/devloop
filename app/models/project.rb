class Project
  include Mongoid::Document
  field :name, :type => String
  field :slug, :type => String
  field :description, :type => String
  field :gitorious_repo, :type => String
  field :errbit_project, :type => String
  field :statusnet_topic, :type => String
  field :jenkins_project, :type => String

  has_many :versions
  has_many :tasks
end
