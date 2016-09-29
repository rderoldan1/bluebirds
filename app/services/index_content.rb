require 'open-uri'
class IndexContent

  attr_accessor :url

  TAGS = "h1, h2, h3, a[href]".freeze

  def initialize(url)
    @url = url
  end

  def start
    extract_metadata
  end

  def self.parse(url)
    new(url).start
  end

  private

  def raw_html
    @html ||=  open(@url)
  rescue => e
    logger.fatal e
    nil
  end

  def parsed_html
    @parsed_html ||= Nokogiri::HTML(raw_html)
  end

  def extract_metadata
    parsed_html.css(TAGS).map do |tag|
      value = tag.text
      value = tag[:href] if tag.name.eql?('a')
      { dom_type: tag.name, content: value }
    end
  end

end
