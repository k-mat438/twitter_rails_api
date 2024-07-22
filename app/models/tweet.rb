# frozen_string_literal: true

class Tweet < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_many_attached :images, dependent: :destroy

  def image_url
    images.map { |image| url_for(image) } if images.attached?
  end
end
