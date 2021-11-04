class Event < ApplicationRecord
  has_many :comments

  validates :src, presence: { message: 'Provided log must include a source IP (ex: "src=...")' }
  validates :dst, presence: { message: 'Provided log must include a destination IP (ex: "dst=...")' }
  validates :log_txt, presence: { message: 'Form cannot be empty' }
end
