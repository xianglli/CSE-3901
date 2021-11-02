require 'json'
require 'net/http'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile
  after_create :create_profile!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :osuid, presence: true

  private

  def create_profile!
    profile = Profile.get_user_profile_from_osu(osuid)
    profile.user_id = id
    # To make things easier we consider those who have appointment are teachers
    # (that mean student assistant will be considered as teacher, so we will allow teacher apply for teaching assistant)
    if profile.majors != nil and profile.appointments[0] == nil
      profile.identity = 'student'
    elsif profile.appointments[0] != nil
      profile.identity = 'teacher'
    end
    profile.save
  end

  def self.get_user_profile(user_id)
    profile = Profile.find_by(user_id: user_id)
    profile
  end

end
