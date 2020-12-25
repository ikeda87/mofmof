class Room < ApplicationRecord
  validates :age, {presence: true, length: {maximum: 20}}
  validates :name, {presence: true, length: {maximum: 20}}
  validates :rent, {presence: true, length: {maximum: 20}}
  validates :adress, {presence: true, length: {maximum: 20}}
  has_many :stations, inverse_of: :room, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: proc { |attributes| attributes['route_name'].blank?}
end
