require 'test_helper'

class DuelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @duel = duels(:one)
  end

  test "should get index" do
    get duels_url
    assert_response :success
  end

  test "should get new" do
    get new_duel_url
    assert_response :success
  end

  test "should create duel" do
    assert_difference('Duel.count') do
      post duels_url, params: { duel: { singer1_id: @duel.singer1_id, singer2_id: @duel.singer2_id } }
    end

    assert_redirected_to duel_url(Duel.last)
  end

  test "should show duel" do
    get duel_url(@duel)
    assert_response :success
  end

  test "should get edit" do
    get edit_duel_url(@duel)
    assert_response :success
  end

  test "should update duel" do
    patch duel_url(@duel), params: { duel: { singer1_id: @duel.singer1_id, singer2_id: @duel.singer2_id } }
    assert_redirected_to duel_url(@duel)
  end

  test "should destroy duel" do
    assert_difference('Duel.count', -1) do
      delete duel_url(@duel)
    end

    assert_redirected_to duels_url
  end
end
