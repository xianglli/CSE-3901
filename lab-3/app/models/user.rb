require 'json'
require 'net/http'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :osuid, presence: true

  def self.get_user_identity (osu_id)
    source = 'https://directory.osu.edu/fpjson.php?name_n='+osu_id
    resp = Net::HTTP.get_response(URI.parse(source))
    result = resp.body
    result = JSON.parse(result)
    logger.debug (result)
  end
end
