class Story
  include Mongoid::Document

  field :title, :type => String

  belongs_to :user

end
