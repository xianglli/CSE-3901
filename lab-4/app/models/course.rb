require 'json'
require 'net/http'
require 'digest'

class Course < ApplicationRecord
  include ActiveModel::Serializers::JSON

  def self.save_data_from_osu
    # process http request to json file
    # source = 'https://content.osu.edu/v2/classes/search?q=cse&campus=col&p=1&term=1222&subject=cse'

    # below is a temp address for testing
    source = 'http://3901.plizong.com/osu_course.json'

    resp = Net::HTTP.get_response(URI.parse(source))
    result = resp.body
    result = JSON.parse(result)
    courses = result['data']['courses']

    # TODO: For temp use in this limited time. Will fix later
    Course.delete_all
    Section.delete_all
    #That is for update certain record, time tight, expect to fix in the next proj

    courses.each { |i|
        course = Course.new
        #select parts from api file. grab information needed.
        course_info = Course.grab_course_info(i["course"])
        course.from_json(course_info.to_json, false)
        sections = i['sections']
        #select parts from api file. grab information needed.
        sections.each { |j|
          section = Section.new
          section_info = Course.grab_section_info(j)
          section.from_json(section_info.to_json, false)
          section.save
        }
        course.save
    }
    # That is per relation do not works, if figure out, then it is end of life
    # Need urgent fix! That may cause severe damage to DB
    #
    # Course.where(tag: false).find_each do |i|
    #   Section.where(courseId: i.courseId).find_each do |j|
    #     Meeting.where(classNumber: j.classNumber).find_each do |k|
    #       k.destroy
    #     end
    #     j.destroy
    #   end
    #   i.destroy
    # end
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
    @section["courseId"] = section_total_info["courseId"]
    @section["section"] = section_total_info["section"]
    @section["component"] = section_total_info["component"]
    @section["instructionMode"] = section_total_info["instructionMode"]
    @section["career"] = section_total_info["career"]
    @section["startDate"] = section_total_info["startDate"]
    @section["endDate"] = section_total_info["endDate"]
    @section["buildingDescription"] = section_total_info["meetings"][0]["buildingDescription"]
    @section["startTime"] = section_total_info["meetings"][0]["startTime"]
    @section["endTime"] = section_total_info["meetings"][0]["endTime"]
    @section["monday"] = section_total_info["meetings"][0]["monday"]
    @section["tuesday"] = section_total_info["meetings"][0]["tuesday"]
    @section["wednesday"] = section_total_info["meetings"][0]["wednesday"]
    @section["thursday"] = section_total_info["meetings"][0]["thursday"]
    @section["friday"] = section_total_info["meetings"][0]["friday"]
    @section["saturday"] = section_total_info["meetings"][0]["saturday"]
    @section["sunday"] = section_total_info["meetings"][0]["sunday"]
    @section["instructors"] = section_total_info["meetings"][0]["instructors"][0]["displayName"]
    @section
  end


end
