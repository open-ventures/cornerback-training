class PerformanceTest < ActiveRecord::Base

  belongs_to :user

  attr_accessible :broad_jump_p1,:broad_jump_p2,:broad_jump_p3,:yard_dash_40_p1,:yard_dash_40_p2,:yard_dash_40_p3,:bench_press_225_p1,:bench_press_225_p2,:bench_press_225_p3,:short_shuttle_p1,:short_shuttle_p2,:short_shuttle_p3,:l_drill_p1,:l_drill_p2,:l_drill_p3,:vertical_jump_p1,:vertical_jump_p2,:vertical_jump_p3,:bench_press_p1,:bench_press_p2,:bench_press_p3,:back_squat_p1,:back_squat_p2,:back_squat_p3,:dead_lift_p1,:dead_lift_p2,:dead_lift_p3,:hang_clean_p1,:hang_clean_p2,:hang_clean_p3

  [:broad_jump_p1,:broad_jump_p2,:broad_jump_p3,:yard_dash_40_p1,:yard_dash_40_p2,:yard_dash_40_p3,:bench_press_225_p1,:bench_press_225_p2,:bench_press_225_p3,:short_shuttle_p1,:short_shuttle_p2,:short_shuttle_p3,:l_drill_p1,:l_drill_p2,:l_drill_p3,:vertical_jump_p1,:vertical_jump_p2,:vertical_jump_p3,:bench_press_p1,:bench_press_p2,:bench_press_p3,:back_squat_p1,:back_squat_p2,:back_squat_p3,:dead_lift_p1,:dead_lift_p2,:dead_lift_p3,:hang_clean_p1,:hang_clean_p2,:hang_clean_p3].each do |attr|
    validates_numericality_of attr, allow_nil: true, greater_than: 0
  end

end

