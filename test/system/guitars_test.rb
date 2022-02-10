# frozen_string_literal: true

require 'application_system_test_case'

class GuitarsTest < ApplicationSystemTestCase
  setup do
    @guitar = guitars(:one)
  end

  test 'visiting the index' do
    visit guitars_url
    assert_selector 'h1', text: 'Guitars'
  end

  test 'should create guitar' do
    visit guitars_url
    click_on 'New guitar'

    check 'Is available' if @guitar.is_available
    fill_in 'Model', with: @guitar.model
    fill_in 'Year', with: @guitar.year
    click_on 'Create Guitar'

    assert_text 'Guitar was successfully created'
  end

  test 'should destroy Guitar' do
    visit guitars_url
    click_on 'Destroy this guitar', match: :first

    assert_text 'Guitar was successfully destroyed'
  end
end
