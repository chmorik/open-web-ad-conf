require 'test_helper'

class AdConfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ad_conf = ad_confs(:one)
  end

  test "should get index" do
    get ad_confs_url, as: :json
    assert_response :success
  end

  test "should create ad_conf" do
    assert_difference('AdConf.count') do
      post ad_confs_url, params: { ad_conf: { ad_code: @ad_conf.ad_code, component: @ad_conf.component, country_code: @ad_conf.country_code, partner_id: @ad_conf.partner_id, platform: @ad_conf.platform } }, as: :json
    end

    assert_response 201
  end

  test "should show ad_conf" do
    get ad_conf_url(@ad_conf), as: :json
    assert_response :success
  end

  test "should update ad_conf" do
    patch ad_conf_url(@ad_conf), params: { ad_conf: { ad_code: @ad_conf.ad_code, component: @ad_conf.component, country_code: @ad_conf.country_code, partner_id: @ad_conf.partner_id, platform: @ad_conf.platform } }, as: :json
    assert_response 200
  end

  test "should destroy ad_conf" do
    assert_difference('AdConf.count', -1) do
      delete ad_conf_url(@ad_conf), as: :json
    end

    assert_response 204
  end
end
