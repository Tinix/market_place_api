# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class ProductsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @product = products(:one)
      end

      test 'should shows products' do
        get api_v1_product_url(@product), as: :json
        assert_response :success
      end

      test 'should show product' do
        get api_v1_product_url(@product), as: :json
        assert_response :success

        json_response = JSON.parse(response.body)
        assert_equal @product.title, json_response['title']
      end
    end
  end
end
