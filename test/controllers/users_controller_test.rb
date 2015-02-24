# -*- encoding : utf-8 -*-
require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user1 = users(:one)
    @user2 = users(:two)

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user one" do
    post :create, user: { actual_weight: @user1.actual_weight, cv: @user1.cv, date_of_birth: @user1.date_of_birth, ideal_weight: @user1.ideal_weight, in_diet: @user1.in_diet, like_diet: @user1.like_diet, mail: @user1.mail, name: @user1.name, size: @user1.size }

    assert_template
  end

  test "should show user one" do
    get :show, id: @user1
    assert_response :success
  end

  test "should get edit one" do
    get :edit, id: @user1
    assert_response :success
  end

  test "should update user one" do
    patch :update, id: @user1, user: { actual_weight: @user1.actual_weight, cv: @user1.cv, date_of_birth: @user1.date_of_birth, ideal_weight: @user1.ideal_weight, in_diet: @user1.in_diet, like_diet: @user1.like_diet, mail: @user1.mail, name: @user1.name, size: @user1.size }
    assert_template
  end

  test "should destroy user one" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user1
    end

    assert_redirected_to users_path
  end

  test "should create user two" do
    post :create, user: { actual_weight: @user2.actual_weight, cv: @user2.cv, date_of_birth: @user2.date_of_birth, ideal_weight: @user2.ideal_weight, in_diet: @user2.in_diet, like_diet: @user2.like_diet, mail: @user2.mail, name: @user2.name, size: @user2.size }
    assert_template
  end

  test "should show user two" do
    get :show, id: @user2
    assert_response :success
  end

  test "should get edit two" do
    get :edit, id: @user2
    assert_response :success
  end

  test "should update user two" do
    patch :update, id: @user2, user: { actual_weight: @user2.actual_weight, cv: @user2.cv, date_of_birth: @user2.date_of_birth, ideal_weight: @user2.ideal_weight, in_diet: @user2.in_diet, like_diet: @user2.like_diet, mail: @user2.mail, name: @user2.name, size: @user2.size }
    assert_template
  end

  test "should destroy user two" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user2
    end

    assert_redirected_to users_path
  end
end


# assert_select
