module ApplicationHelper
  require "uri"

  def text_url_to_link text
    URI.extract(text, ['http']).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"

      text.gsub!(url, sub_text)
    end

    return text
  end

  def url_for_twitter(user)
    "https://twitter.com/#{user.nickname}"
  end
end
