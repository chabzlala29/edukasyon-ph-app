module ApplicationHelper
  def is_admin_page?
    !!params[:controller].match(/admin\//)
  end

  def link_to_modal(title, url, options = {})
    options[:class] = ["modal-link", options[:class]].compact.join(" ")
    link_to title, url, options
  end

  def logo_tag(options = {})
    image_tag "edukasyon-logo.png", height: options[:height] || "72", class: "edukasyon-logo #{options[:class]}"
  end
end
