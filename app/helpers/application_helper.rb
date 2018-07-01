module ApplicationHelper
  def is_admin_page?
    !!params[:controller].match(/admin\//)
  end

  def link_to_modal(title, url, options = {})
    options[:class] = ["modal-link", options[:class]].compact.join(" ")
    link_to title, url, options
  end
end
