# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :searches, dependent: :destroy
end
