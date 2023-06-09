# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  enum status: { active: 'active', inactive: 'inactive' }

  validates :name, :uri, :status, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name status created_at]
  end
end
