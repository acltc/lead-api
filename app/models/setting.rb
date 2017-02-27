class Setting < ApplicationRecord
  validates :phone, :presence => true,
                    :numericality => true,
                    :length => { :minimum => 10, :maximum => 10 }
end
