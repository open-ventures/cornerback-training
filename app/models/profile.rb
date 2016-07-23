class Profile < ActiveRecord::Base

  extend Enumerize

  attr_accessible :title, :body
  belongs_to :user

  attr_accessible :user_id,:dob,:country,:height_ft,:height_in,:height_m,:weight,:weight_kg,:football_exp_level,:weight_training_exp,:broad_jump_last, 
  :broad_jump_pr,:yard_dash_40_last,:yard_dash_40_pr,:bench_press_225_last,:bench_press_225_pr,:short_shuttle_last,:short_shuttle_pr,
  :l_drill_last,:l_drill_pr,:vertical_jump_last,:vertical_jump_pr,:bench_press_last,:bench_press_pr,:back_squat_last,
  :back_squat_pr,:dead_lift_last,:dead_lift_pr,:hang_clean_last,:hang_clean_pr, :avatar

  validates_numericality_of :height_in, greater_than: 0.0, less_than: 12.00, allow_nil: true

  validate :must_provide_height

  has_attached_file :avatar, 
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png",
    storage: 's3',
    s3_credentials: {
      bucket: ENV['AWS_BUCKET'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }

  [:weight,:weight_kg, :broad_jump_last, 
  :broad_jump_pr,:yard_dash_40_last,:yard_dash_40_pr,:bench_press_225_last,:bench_press_225_pr,:short_shuttle_last,:short_shuttle_pr,
  :l_drill_last,:l_drill_pr,:vertical_jump_last,:vertical_jump_pr,:bench_press_last,:bench_press_pr,:back_squat_last,
  :back_squat_pr,:dead_lift_last,:dead_lift_pr,:hang_clean_last,:hang_clean_pr].each do |attr|
    validates_numericality_of attr, allow_nil: true, greater_than: 0
  end

  def must_provide_height
    if self.height_ft.nil? && self.height_m.nil?
      self.errors[:height_ft] = "can't be blank"
    end

    if ((self.height_ft) && (self.height_ft < 0))
      self.errors[:height_ft] = "must be greater than 0"
    end

    if ((self.height_m) && (self.height_m < 0))
      self.errors[:height_m] = "must be greater than 0"
    end
  end

  enumerize :football_exp_level, in: {
    high_school_junior_varsity: 1,
    hight_school_varsity: 2,
    semi_pro: 3,
    junior_college: 4,
    college: 5,
    indoor_football: 6,
    arena_2: 7,
    arena_1: 8,
    ufl: 9,
    canadian_football_league: 10,
    national_football_league: 11

  }

  enumerize :weight_training_exp, in: {
    less_than_one_year: 1,
    one_to_three_years: 2,
    three_to_5_years: 3,
    more_than_5_years: 4,
  }


end
