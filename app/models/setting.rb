class Setting < ApplicationRecord
  validates :phone, phony_plausible: true
  phony_normalize :phone, default_country_code: 'US'
end
