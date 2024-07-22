# frozen_string_literal: true

module Api
  module V1
    class ImagesController < ApplicationController
      def create
        tweet = find_tweet
        attach_images_to_tweet(tweet)
        render_created_images(tweet)
      end

      private

      def find_tweet
        current_api_v1_user.tweets.find(image_params[:tweet_id])
      end

      def attach_images_to_tweet(tweet)
        image_params[:tweet_image_datas].each_with_index do |image_data, index|
          tweet.images.attach(
            io: StringIO.new(decoded_image_data(image_data)),
            filename: image_params[:tweet_image_names][index]
          )
        end
      end

      def render_created_images(tweet)
        render json: { tweet_images: tweet.images }, status: :created
      end

      def decoded_image_data(image_data)
        Base64.decode64(image_data)
      end

      def image_params
        params.require(:image).permit(:tweet_id, tweet_image_datas: [], tweet_image_names: [])
      end
    end
  end
end
