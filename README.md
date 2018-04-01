# Description:
This API has two end point
1. POST /contents : Which accepts one valid URL. When it gets a valid URL it parse contents on H1, H2 and H3 tags. 
If a link has multiple H1, H2 or H3 tag then it will separate them with ";" 
2. GET /contents : Return all saved data from database

## Database Table Field:
contents: page_link, h1_tag, h2_tag, h3_tag

## Gem File Needed:
1. jsonapi-resources - gem 'jsonapi-resources'
2. nokogiri - gem install nokogiri

