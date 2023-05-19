# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  enum status: { active: 'active', inactive: 'inactive' }

  validates :name, :uri, :status, presence: true
end
