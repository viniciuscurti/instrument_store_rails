# frozen_string_literal: true

require 'test_helper'

class GuitarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guitar = guitars(:one)
  end

  test 'should get index' do
    get guitars_url
    assert_response :success
  end

  test 'should get new' do
    get new_guitar_url
    assert_response :success
  end

  test 'should create guitar' do
    assert_difference('Guitar.count') do
      post guitars_url, params: { guitar: { is_available: @guitar.is_available, model: @guitar.model, year: @guitar.year } }
    end

    assert_redirected_to guitars_url
  end

  test 'should destroy guitar' do
    assert_difference('Guitar.count', -1) do
      delete guitar_url(@guitar)
    end

    assert_redirected_to guitars_url
  end
end
