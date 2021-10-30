require 'json'
require 'net/http'
require 'digest'

class Course < ApplicationRecord
  include ActiveModel::Serializers::JSON

  scope :filter_by_number, -> (number) { where("number like ?", "%#{number}%")}

  def self.save_data_from_osu
    # process http request to json file
    source = 'https://content.osu.edu/v2/classes/search?q=cse&campus=col&p=1&term=1222&subject=cse'
    resp = Net::HTTP.get_response(URI.parse(source))
    result = resp.body
    result = JSON.parse(result)
    courses = result['data']['courses']

    # process json format to database
    Course.update_all(tag: false)
    courses.each { |i|
      course_md5 = Digest::MD5.hexdigest(i.to_json)
      if Course.where(md5: course_md5).exists?
        course = Course.find_by(md5: course_md5)
        course.update(tag: true)
      else
        course = Course.new
        course.from_json(i.to_json, true)
        course.md5 = course_md5
        course.tag = true
        sections = i['sections']
        sections.each { |j|
          section = Section.new
          j.delete("attributes")
          section.from_json(j.to_json, false)
          section.course_id = course.id
          section.save
        }
        course.save
      end
    }
    # That is per relation do not works, if figure out, then it is end of life
    Course.where(tag: false).find_each do |i|
      @section = i.where(courseId: @section.courseId)
      @section.each do |j|
        j.destroy
      end
      i.destroy
    end
  end
end
