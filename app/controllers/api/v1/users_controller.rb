# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def show
        render json: User.find(params[:id])
      end

      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password_digest)
      end
    end
  end
end
