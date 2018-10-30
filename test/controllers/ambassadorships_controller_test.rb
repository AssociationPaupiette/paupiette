require 'test_helper'

class AmbassadorshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ambassadorship = ambassadorships(:one)
  end

  test "should get index" do
    get ambassadorships_url
    assert_response :success
  end

  test "should get new" do
    get new_ambassadorship_url
    assert_response :success
  end

  test "should create ambassadorship" do
    assert_difference('Ambassadorship.count') do
      post ambassadorships_url, params: { ambassadorship: {  } }
    end

    assert_redirected_to ambassadorship_url(Ambassadorship.last)
  end

  test "should show ambassadorship" do
    get ambassadorship_url(@ambassadorship)
    assert_response :success
  end

  test "should get edit" do
    get edit_ambassadorship_url(@ambassadorship)
    assert_response :success
  end

  test "should update ambassadorship" do
    patch ambassadorship_url(@ambassadorship), params: { ambassadorship: {  } }
    assert_redirected_to ambassadorship_url(@ambassadorship)
  end

  test "should destroy ambassadorship" do
    assert_difference('Ambassadorship.count', -1) do
      delete ambassadorship_url(@ambassadorship)
    end

    assert_redirected_to ambassadorships_url
  end
end
