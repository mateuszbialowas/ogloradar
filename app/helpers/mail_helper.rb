# frozen_string_literal: true

module MailHelper
  include Rails.application.routes.url_helpers

  def public_image_url(source)
    URI.join(root_url, image_path(source)).to_s
  end

  def email_image_tag(image, **options)
    return image_tag image, **options if image

    image_tag(public_image_url('product_thumbnail_missing.jpg'), **options)
  end
end
