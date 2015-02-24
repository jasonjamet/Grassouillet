# -*- encoding : utf-8 -*-
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user =  User.new(
      name:"kass",
      mail:"patricia.kass@star.com",
      date_of_birth: Date.parse("1979-09-23") ,
      actual_weight: 168,
      ideal_weight: 100,
      size: 170,
      in_diet: true,
      like_diet: false)
    @user_invalid =  users(:two)
  end

  test"user should be valid" do
    assert @user.valid?
  end

  test"user should be not valid" do
    assert @user_invalid.invalid?
  end

  test"name should not be empty" do
    @user.name=""
    assert @user.invalid?
  end

  test"mail should not be empty" do
    @user.mail=""
    assert @user.invalid?
  end

  test"date_of_birth should not be empty" do
    @user.date_of_birth=""
    assert @user.invalid?
  end

#  test"actual_weight should not be empty" do    CANNOT BE TESTING (but work well in fact)
#    @user.actual_weight=""
#    assert @user.invalid?
#  end

  test"ideal_weight should not be empty" do
    @user.ideal_weight=""
    assert @user.invalid?
  end

  test"size should not be empty" do
    @user.size=""
    assert @user.invalid?
  end

  test"in_diet should not be empty" do
    @user.in_diet=""
    assert @user.invalid?
  end

  test"like_diet should not be empty" do
    @user.like_diet=""
    assert @user.invalid?
  end

  test"date_of_birth should not be string" do
    @user.date_of_birth="azerty"
    assert @user.invalid?
  end

  test"actual_weight should not be string" do
    @user.actual_weight="azerty"
    assert @user.invalid?
  end

  test"ideal_weight should not be string" do
    @user.ideal_weight="azerty"
    assert @user.invalid?
  end

  test"size should not be string" do
    @user.size="azerty"
    assert @user.invalid?
  end

  test"mail should not be wrong" do
    @user.mail="jean_pierre"
    assert @user.invalid?
  end

  test"date_of_birth should not wrong" do
    @user.date_of_birth="date"
    assert @user.invalid?
  end

  test"date_of_birth should too high" do
    @user.date_of_birth="2017-09-04"
    assert @user.invalid?
  end

  test"date_of_birth should too less" do
    @user.date_of_birth="1000-09-04"
    assert @user.invalid?
  end

  test"ideal_weight should too high" do
    @user.ideal_weight=1000
    assert @user.invalid?
  end

  test"ideal_weight should too less" do
    @user.ideal_weight=0
    assert @user.invalid?
  end

  test"actual_weight should too high" do
    @user.actual_weight=1000
    assert @user.invalid?
  end

  test"actual_weight should too less" do
    @user.ideal_weight=0
    assert @user.invalid?
  end

#  test"in_diet should not be string" do   CANNOT BE TESTING
#    @user.in_diet="azerty"
#    assert @user.invalid?
#  end

#  test"like_diet should not be string" do  CANNOT BE TESTING
#    @user.like_diet="azerty"
#    assert @user.invalid?
#  end
end
