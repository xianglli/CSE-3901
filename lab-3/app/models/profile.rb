require 'json'
require 'net/http'

class Profile < ApplicationRecord
  belongs_to :user
  validates_associated :user

  def self.get_user_profile (osuid)
    source = 'http://directory.osu.edu/fpjson.php?name_n=' + osuid.to_s
    resp = Net::HTTP.get_response(URI.parse(source))
    result = resp.body
    result = JSON.parse(result)
    result = result[0]
    profile = Profile.new
    profile.from_json(result.to_json, false)
    profile["picture_url"] = "https://opic.osu.edu/"+ osuid.to_s
    return profile
  end
end
