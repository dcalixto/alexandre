module MethodsPracticeHelpers
  URI_REGEXP = %r{^[-a-z]+://|^(?:cid|data):|^//}i
  def image_tag(source, options = {})
    options = options.symbolize_keys
    # check_for_image_tag_errors(options)
    skip_pipeline = options.delete(:skip_pipeline)

    options[:src] = resolve_image_source(source, skip_pipeline)

    if options[:srcset] && !options[:srcset].is_a?(String)
      options[:srcset] = options[:srcset].map do |src_path, size|
        src_path = path_to_image(src_path, skip_pipeline: skip_pipeline)
        "#{src_path} #{size}"
      end.join(', ')
    end

    options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]

    options[:loading] ||= image_loading if image_loading
    options[:decoding] ||= image_decoding if image_decoding

    tag('img', options)
  end

  def asset_path(source, options = {})
  raise ArgumentError, 'nil is not a valid asset source' if source.nil?

  source = source.to_s
  return '' if source.blank?
  return source if URI_REGEXP.match?(source)

  tail = source[/([?#].+)$/]
  source = source.sub(/([?#].+)$/, '')

  if extname = compute_asset_extname(source, options)
    source = "#{source}#{extname}"
  end

  if source[0] != '/'
    source = if options[:skip_pipeline]
               public_compute_asset_path(source, options)
             else
               compute_asset_path(source, options)
             end
  end

  alias_method :path_to_asset, :asset_path # aliased to avoid conflicts with an asset_path named route

      # Computes the full URL to an asset in the public directory. This
      # will use +asset_path+ internally, so most of their behaviors
      # will be the same. If :host options is set, it overwrites global
      # +config.action_controller.asset_host+ setting.
      #
      # All other options provided are forwarded to +asset_path+ call.
      #
      #   asset_url "application.js"                                 # => http://example.com/assets/application.js
      #   asset_url "application.js", host: "http://cdn.example.com" # => http://cdn.example.com/assets/application.js
      #
      def asset_url(source, options = {})
        path_to_asset(source, options.merge(protocol: :request))
      end
  alias url_to_asset asset_url # aliased to avoid conflicts with an asset_url named route

 

  # Compute extname to append to asset path. Returns +nil+ if
  # nothing should be added.
  def compute_asset_extname(source, options = {})
    return if options[:extname] == false

    extname = options[:extname] || ASSET_EXTENSIONS[options[:type]]
    extname if extname && File.extname(source) != extname
  end
end


  alias_method :path_to_asset, :asset_path # aliased to avoid conflicts with an asset_path named route

  # Computes the full URL to an asset in the public directory. This
  # will use +asset_path+ internally, so most of their behaviors
  # will be the same. If :host options is set, it overwrites global
  # +config.action_controller.asset_host+ setting.
  #
  # All other options provided are forwarded to +asset_path+ call.
  #
  #   asset_url "application.js"                                 # => http://example.com/assets/application.js
  #   asset_url "application.js", host: "http://cdn.example.com" # => http://cdn.example.com/assets/application.js
  #
  def asset_url(source, options = {})
    path_to_asset(source, options.merge(protocol: :request))
  end

  def image_path(source, options = {})
    path_to_asset(source, { type: :image }.merge!(options))
  end
  alias_method :path_to_image, :image_path
 ASSET_EXTENSIONS = {
    javascript: '.js',
    stylesheet: '.css'
  }
  def resolve_image_source(source, skip_pipeline)
    if source.is_a?(Symbol) || source.is_a?(String)
      path_to_image(source, skip_pipeline: skip_pipeline)
    else
      polymorphic_url(source)
    end
  rescue NoMethodError => e
    raise ArgumentError, "Can't resolve image into URL: #{e}"
  end

  def extract_dimensions(size)
    size = size.to_s
    if /\A\d+x\d+\z/.match?(size)
      size.split('x')
    elsif /\A\d+\z/.match?(size)
      [size, size]
    end
  end
end
