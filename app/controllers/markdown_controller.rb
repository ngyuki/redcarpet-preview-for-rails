require 'redcarpet'
require 'coderay'
require 'cgi'

class MarkdownController < ActionController::Base

  # action raw
  def raw
    text = request.body.read
    response.headers['Access-Control-Allow-Origin'] = "*"
    render :text => markdown(text)
  rescue => e
    response.headers['Content-Type'] = "text/plain"
    render :text => "problem parsing markdown text: #{e.message}", :status => 500
  end

  # SyntaxHighlighting
  class SyntaxHighlighting < ::Redcarpet::Render::HTML

    def highlight(code, language)
      ::CodeRay.scan(code, language).html(:line_numbers => :inline, :line_number_anchors => false, :wrap => :span)
    end

    def block_code(code, language)
      if language != nil
        "<pre><code class='#{language} syntaxhl'>" + highlight(code, language) + "</code></pre>"
      else
        "<pre>" + CGI.escapeHTML(code) + "</pre>"
      end
    end

    def block_quote(quote)
      "<blockquote>\n" << quote.gsub(/\n([^<])/,'<br>\1') << "</blockquote>\n"
    end
  end

  # markdown
  def markdown(text)
    markdown = ::Redcarpet::Markdown.new(
      SyntaxHighlighting,
      :autolink => true,
      :space_after_headers => true,
      :fenced_code_blocks => true,
      :tables => true,
      :strikethrough => true,
      :superscript => true
    )
    text = markdown.render(text)
    "<div class=\"wiki\">#{text}</div>"
  end
end
