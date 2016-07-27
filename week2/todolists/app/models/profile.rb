class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: { in: ["male","female"] }
  validate :first_or_last
  validate :boy_sue

  def first_or_last
  	if first_name.blank? & last_name.blank?
  		errors.add(:first_name,"must have at least a first or last name!")
  	end
  end

  def boy_sue
  	if gender == "male"
  		if first_name == "Sue"
  			errors.add(:first_name,"cannot be male!")
  		end
  	end
  end

  def self.get_all_profiles(miny,maxy)
  	Profile.where(:birth_year => miny..maxy).order('birth_year asc')
  end
end
