module ApplicationHelper
  require "uri"

  def text_url_to_link text
    URI.extract(text, ['http', 'https']).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\" class=\"wob-ba\">" << url << "</a>"

      text.gsub!(url, sub_text)
    end

    return text
  end

  def nl2br(str)
    return sanitize(str).gsub("\n", '<br>').html_safe
  end

  # 終了していたら trueを返す
  def is_ended?(ended_at)
    ended_at < Time.now ? true : false
  end

  def url_for_twitter(user)
    "https://twitter.com/#{user.nickname}"
  end
end
