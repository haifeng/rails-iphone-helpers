module ::ActionView::Helpers::TagHelper
  def iphone(key, *options)
    options = options.extract_options! || {}
    tagname, attributes = send("iphone_#{key}", options)

    tag(tagname, attributes)
  end

  protected

  def iphone_fullscreen(options)
    options[:name] = 'apple-mobile-web-app-capable'
    options[:content] = 'yes'
    [:meta, options]
  end

  def iphone_icon(options)
    options[:rel] = 'apple-touch-icon'
    options[:rel] += '-precomposed' if options[:precomposed]
    options[:precomposed] = nil if options[:precomposed]
    options[:href] = image_path(options[:href])
    [:link, options]
  end

  def iphone_splash(options)
    options[:rel] = 'apple-touch-startup-image'
    options[:href] = image_path(options[:href])
    [:link, options]
  end

  def iphone_status_bar(options)
    options[:name] = 'apple-mobile-web-app-status-bar-style'
    options[:content] = (%w[black black-translucent].include?(options[:color]) && options[:color]) || 'default'
    options[:color] = nil if options[:color]
    [:meta, options]
  end

  def iphone_viewport(options)
    translate = {:initial_scale => :'initial-scale', :maximum_scale => :'maximum-scale', :minimum_scale => :'minimum-scale', :user_scalable => :'user-scalable'}
    defaults = {:'initial-scale' => 1, :'maximum-scale' => 1, :width => 'device-width'}
    content = options.each do |k,v|
      k = (translate.key?(k) && options.delete(k) && translate[k]) || k
      options[k] = v
    end
    content = defaults.merge(content).collect { |k,v| "#{k}=#{v}" }.join('; ')
    options = {:content => content, :name => 'viewport'}
    [:meta, options]
  end
end
