class Event < ApplicationRecord
  validates :src, presence: true
  validates :dst, presence: true
  validates :log_txt, presence: true, uniqueness: true
end
