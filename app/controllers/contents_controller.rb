require 'nokogiri'
require 'open-uri'
require 'uri'

class ContentsController < JSONAPI::ResourceController

  def index
    contents = Content.all
    contents_resources = contents.map {|content| ContentResource.new(content, nil)}

    render json: JSONAPI::ResourceSerializer.new(ContentResource).serialize_to_hash(contents_resources)
  end

  def create

    begin

      if params[:page_link] =~ URI::regexp

        page = Nokogiri::HTML(open(params[:page_link]))
        h1 = page.css('h1').map(&:text).join(";")
        h2 = page.css('h2').map(&:text).join(";")
        h3 = page.css('h3').map(&:text).join(";")

        content = Content.create!(:page_link => params[:page_link], :h1_tag => h1, :h2_tag => h2, :h3_tag => h3)
        render json: JSONAPI::ResourceSerializer.new(ContentResource).serialize_to_hash(ContentResource.new(content, nil))

      else
        render json: {'error': 'Link is not valid', 'status': :bad_request}

      end
    rescue Exception => e
      render json: {'error': e.message, 'status': 400}
    end

  end
end
