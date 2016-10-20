class MyValidator < ActiveModel::Validator
  def validate(task)  #only contains one "validate" method per class
    # unless task.due_date >= Date.now
    #   record.errors[:due_date] << 'The task must be due at a future date!'
    # end
  end
end
