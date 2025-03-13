class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  protected

  def clear_attributes(attributes_to_clear = nil)
    attributes_to_clear ||= []
    attributes_to_clear.each do |key|
      self[key] = nil
    end
  end
end
