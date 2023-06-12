# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :searches, dependent: :destroy

  def self.ransackable_attributes(_auth_object = nil)
    %w[id email]
  end
end
