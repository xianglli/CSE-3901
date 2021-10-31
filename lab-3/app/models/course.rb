require 'json'
require 'net/http'
require 'digest'

class Course < ApplicationRecord
  include ActiveModel::Serializers::JSON

  scope :filter_by_number, -> (number) { where("number like ?", "%#{number}%") }

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
        # TODO: select parts from api file. grab information needed.
        course_info = Course.grab_course_info(i["course"])
        logger.debug ">>>>>>>#{course_info}>>>>>>>>>>>>>>>"
        course.from_json(course_info.to_json, false)
        course.md5 = course_md5
        course.tag = true
        sections = i['sections']
        # TODO: also select parts from api file. grab information needed.
        sections.each { |j|
          section = Section.new
          section_info = Course.grab_section_info(j)
          section.from_json(section_info.to_json, false)
          meetings = j['meetings']
          meetings.each { |k|
            meeting = Meeting.new
            meeting["classNumber"] = section["classNumber"]
            meeting_info = Course.grab_meeting_info(k)
            meeting.from_json(meeting_info.to_json, false)
            meeting.save
          }
          section.save
        }
        course.save
      end
    }
    # That is per relation do not works, if figure out, then it is end of life
    Course.where(tag: false).find_each do |i|
      Section.where(courseId: i.courseId).find_each do |j|
        Meeting.where(classNumber: j.classNumber).find_each do |k|
          k.destroy
        end
        j.destroy
      end
      i.destroy
    end
  end

  private

  def self.grab_course_info (course_total_info)
    @course = Hash.new
    @course["title"] = course_total_info["title"]
    @course["subject"] = course_total_info["subject"]
    @course["catalogNumber"] = course_total_info["catalogNumber"]
    @course["shortDescription"] = course_total_info["shortDescription"]
    @course["description"] = course_total_info["description"]
    @course["component"] = course_total_info["component"]
    @course["campus"] = course_total_info["campus"]
    @course["courseAttributes"] = course_total_info["courseAttributes"]
    @course["courseId"] = course_total_info["courseId"]
    @course
  end

  def self.grab_section_info (section_total_info)
    @section = Hash.new
    @section["classNumber"] = section_total_info["classNumber"]
    @section["section"] = section_total_info["section"]
    @section["component"] = section_total_info["component"]
    @section["instructionMode"] = section_total_info["instructionMode"]
    @section["career"] = section_total_info["career"]
    @section["startDate"] = section_total_info["startDate"]
    @section["endDate"] = section_total_info["endDate"]
    @section
  end

  def self.grab_meeting_info (meeting_total_info)
    @meeting = Hash.new
    @meeting["buildingDescription"] = meeting_total_info["buildingDescription"]
    @meeting["startTime"] = meeting_total_info["startTime"]
    @meeting["endTime"] = meeting_total_info["endTime"]
    @meeting["monday"] = meeting_total_info["monday"]
    @meeting["tuesday"] = meeting_total_info["tuesday"]
    @meeting["wednesday"] = meeting_total_info["wednesday"]
    @meeting["thursday"] = meeting_total_info["thursday"]
    @meeting["friday"] = meeting_total_info["friday"]
    @meeting["saturday"] = meeting_total_info["saturday"]
    @meeting["sunday"] = meeting_total_info["sunday"]
    @meeting["instructors"] = meeting_total_info["instructors"]
    @meeting
  end

end
