# frozen_string_literal: true

class FlashComponent < BaseViewComponent
  attr_reader :type, :message

  def initialize(data:)
    @type = data[0]
    @message = data[1]
  end

  ICON_NAMES = {
    notice: 'information-circle.svg',
    success: 'check-circle.svg',
    error: 'exclamation-circle.svg',
    alert: 'exclamation-circle.svg'
  }.freeze

  ICON_CLASSES = {
    notice: 'border-blue-300 bg-blue-50 text-blue-800',
    success: 'text-green-800 border-green-300 bg-green-50',
    error: 'text-red-800 border-red-300 bg-red-50',
    alert: 'text-red-800 border-red-300 bg-red-50'
  }.freeze

  CLOSE_ICONS_CLASSES = {
    notice: 'text-blue-500 hover:bg-blue-200 focus:ring-blue-400',
    success: 'text-green-500 hover:bg-green-200 focus:ring-green-400',
    error: 'text-red-500 hover:bg-red-200 focus:ring-red-400',
    alert: 'text-red-500 hover:bg-red-200 focus:ring-red-400'
  }.freeze

  def icon_name
    ICON_NAMES[type.to_sym]
  end

  def icon_class
    ICON_CLASSES[type.to_sym]
  end

  def close_icon_class
    CLOSE_ICONS_CLASSES[type.to_sym]
  end
end
