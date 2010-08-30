require 'test_helper'

class IphoneHelpersTest < ActionView::TestCase
  ActionController::Base.assets_dir = '/' # required in order to use image_path outside rails.

  test 'apple mobile web app capable' do
    assert_equal iphone(:fullscreen), '<meta content="yes" name="apple-mobile-web-app-capable" />'
  end

  test 'apple mobile web app status bar style' do
    assert_equal iphone(:status_bar), '<meta content="default" name="apple-mobile-web-app-status-bar-style" />'
  end

  test 'apple mobile web app status bar style black' do
    assert_equal iphone(:status_bar, :color => 'black'), '<meta content="black" name="apple-mobile-web-app-status-bar-style" />'
  end

  test 'apple mobile web app status bar style black translucent' do
    assert_equal iphone(:status_bar, :color => 'black-translucent'), '<meta content="black-translucent" name="apple-mobile-web-app-status-bar-style" />'
  end

  test 'apple touch icon' do
    assert_equal iphone(:icon, :href => 'iphone.png'), '<link href="/images/iphone.png" rel="apple-touch-icon" />'
  end

  test 'apple touch icon precomposed' do
    assert_equal iphone(:icon, :href => 'iphone.png', :precomposed => true), '<link href="/images/iphone.png" rel="apple-touch-icon-precomposed" />'
  end

  test 'apple touch startup image' do
    assert_equal iphone(:splash, :href => 'splash.png'), '<link href="/images/splash.png" rel="apple-touch-startup-image" />'
  end

  test 'viewport' do
    assert_equal iphone(:viewport), '<meta content="width=device-width; initial-scale=1; maximum-scale=1" name="viewport" />'
  end

  test 'viewport with custom attributes' do
    assert_equal iphone(:viewport, :width => 320, :height => 480, :initial_scale => 2.5, :minimum_scale => 0.5, :maximum_scale => 3, :user_scalable => 'no'), '<meta content="width=320; user-scalable=no; height=480; minimum-scale=0.5; initial-scale=2.5; maximum-scale=3" name="viewport" />'
  end
end
