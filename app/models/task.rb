class Task < ActiveRecord::Base
  validates_with MyValidator

  belongs_to :user
end
