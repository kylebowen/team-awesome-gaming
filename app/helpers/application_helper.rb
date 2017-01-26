module ApplicationHelper

  def full_title(title = "")
    if title.empty?
      base_title
    else
      "#{title} | #{base_title}"
    end
  end

  private

    def base_title
      "Team Awesome Games"
    end
end
