require 'json'
require 'net/http'

class Course < ApplicationRecord
  include ActiveModel::Serializers::JSON

  def self.save_data_from_osu
    # process http request to json file
    # TODO: Change the URI to user specified one
    source = 'https://content.osu.edu/v2/classes/search?q=cse&campus=col&p=1&term=1222&subject=cse'
    resp = Net::HTTP.get_response(URI.parse(source))
    result = resp.body
    result = JSON.parse(result)
    courses = result['data']['courses']

    # process json format to hash
    courses.each { |i|
      course = Course.new
      course.from_json(i.to_json, true)
      course.save
      sections = i['sections']
      sections.each { |j|
        section = Section.new
        j.delete("attributes")
        section.from_json(j.to_json, false)
        section.save
      }
    }
  end
end
