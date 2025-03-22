class City < ApplicationRecord
  belongs_to :state

  def self.ransackable_attributes(auth_object = nil)
    [ "description" ]
  end
end
