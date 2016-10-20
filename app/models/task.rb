class Task < ActiveRecord::Base
  validates_with MyValidator
end
