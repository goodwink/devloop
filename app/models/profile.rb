class Profile
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :homepage, :type => String
  field :statusnet, :type => String
  field :gitorious, :type => String

  belongs_to :user
end
