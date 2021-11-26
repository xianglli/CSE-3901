require 'json'
require 'net/http'

class User < ApplicationRecord
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable
  after_create :create_profile!
  validates :osu_id, presence: true

  def initials

  end

  def profile?
    avator.present?
  end

  private

  def create_profile!
    profile = User.find_by(osu_id: osu_id)
    # To make things easier we consider those who have appointment are teachers
    # (that mean student assistant will be considered as teacher, so we will allow teacher apply for teaching assistant)
    source = 'http://directory.osu.edu/fpjson.php?name_n=' + osu_id.to_s
    resp = Net::HTTP.get_response(URI.parse(source))
    result = resp.body
    result = JSON.parse(result)
    result = result[0]
    logger.debug "<<<<<<<#{result}<<<<<<<<<<<<"
    if result != nil
      user_info = User.grab_user_info(result)
      profile.from_json(user_info.to_json, false)
      profile["avator"] = "https://opic.osu.edu/" + osu_id.to_s
    else
      profile["display_name"] = "guest"
      profile["role"] = "guest"
    end

    profile.save
  end

  def self.grab_user_info (user_total_info)
    @user = Hash.new
    @user["display_name"] = user_total_info["display_name"]
    @user["admin"] = false
    if user_total_info["majors"] != nil and user_total_info["appointments"][0] == nil
      @user["role"] = 'student'
    elsif user_total_info["appointments"][0] != nil
      @user["role"] = 'teacher'
    end
    @user
  end


end
