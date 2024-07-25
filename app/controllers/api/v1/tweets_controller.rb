# frozen_string_literal: true

module Api
  module V1
    class TweetsController < ApplicationController
      def index
        # tweets = Tweet.all.order(updated_at: 'DESC')
        # render json: tweets, status: :ok
        tweets = Tweet.includes(:user).order(updated_at: 'DESC')
        render json: tweets, include: [:user], methods: [:image_url], status: :ok
      end

      def create
        tweet = current_api_v1_user.tweets.build(tweet_params)
        # tweet = User.find(26).tweets.build(tweet_params)
        if tweet.save
          render json: tweet, status: :ok
        else
          render json: tweet.errors, status: :unprocessable_entity
        end
      end

      private

      def tweet_params
        params.require(:tweet).permit(:content)
      end
    end
  end
end
