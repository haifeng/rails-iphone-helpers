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
    assert_equal iphone(:viewport), '<meta content="initial-scale=1.0; width=device-width; maximum-scale=1.0" name="viewport" />'
  end

  test 'viewport with custom width and height' do
    assert_equal iphone(:viewport, :width => 320, :height => 480), '<meta content="initial-scale=1.0; width=320; height=480; maximum-scale=1.0" name="viewport" />'
  end
end
