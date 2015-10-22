module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
    <input
      type="hidden"
      name="authenticity_token"
      value="#{form_authenticity_token}">
    HTML
  end

  def log_out_button
    <<-HTML.html_safe
      <button value='submit'>Log Out</button>
    HTML
  end

end
