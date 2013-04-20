require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: { act: @member.act, camera: @member.camera, credits: @member.credits, direct: @member.direct, extra: @member.extra, marketing: @member.marketing, other: @member.other, pa: @member.pa, paid: @member.paid, password: @member.password, password_digest: @member.password_digest, produce: @member.produce, salary: @member.salary, setdesign: @member.setdesign, sound: @member.sound, stunt: @member.stunt, username: @member.username, wardrobe: @member.wardrobe, what: @member.what, write: @member.write }
    end

    assert_redirected_to member_path(assigns(:member))
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    put :update, id: @member, member: { act: @member.act, camera: @member.camera, credits: @member.credits, direct: @member.direct, extra: @member.extra, marketing: @member.marketing, other: @member.other, pa: @member.pa, paid: @member.paid, password: @member.password, password_digest: @member.password_digest, produce: @member.produce, salary: @member.salary, setdesign: @member.setdesign, sound: @member.sound, stunt: @member.stunt, username: @member.username, wardrobe: @member.wardrobe, what: @member.what, write: @member.write }
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end
