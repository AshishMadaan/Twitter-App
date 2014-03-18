class Tweet < ActiveRecord::Base
  attr_accessible :user_id, :content, :id

  belongs_to :user
end
