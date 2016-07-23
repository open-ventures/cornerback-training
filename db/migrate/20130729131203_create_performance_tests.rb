class CreatePerformanceTests < ActiveRecord::Migration
  def change
    create_table :performance_tests do |t|

      t.decimal :broad_jump_p1, precision: 10, scale: 2
      t.decimal :broad_jump_p2, precision: 10, scale: 2
      t.decimal :broad_jump_p3, precision: 10, scale: 2
      t.decimal :yard_dash_40_p1, precision: 10, scale: 2
      t.decimal :yard_dash_40_p2, precision: 10, scale: 2
      t.decimal :yard_dash_40_p3, precision: 10, scale: 2
      t.decimal :bench_press_225_p1, precision: 10, scale: 2
      t.decimal :bench_press_225_p2, precision: 10, scale: 2
      t.decimal :bench_press_225_p3, precision: 10, scale: 2
      t.decimal :short_shuttle_p1, precision: 10, scale: 2
      t.decimal :short_shuttle_p2, precision: 10, scale: 2
      t.decimal :short_shuttle_p3, precision: 10, scale: 2
      t.decimal :l_drill_p1, precision: 10, scale: 2
      t.decimal :l_drill_p2, precision: 10, scale: 2
      t.decimal :l_drill_p3, precision: 10, scale: 2
      t.decimal :vertical_jump_p1, precision: 10, scale: 2
      t.decimal :vertical_jump_p2, precision: 10, scale: 2
      t.decimal :vertical_jump_p3, precision: 10, scale: 2
      t.decimal :bench_press_p1, precision: 10, scale: 2
      t.decimal :bench_press_p2, precision: 10, scale: 2
      t.decimal :bench_press_p3, precision: 10, scale: 2
      t.decimal :back_squat_p1, precision: 10, scale: 2
      t.decimal :back_squat_p2, precision: 10, scale: 2
      t.decimal :back_squat_p3, precision: 10, scale: 2
      t.decimal :dead_lift_p1, precision: 10, scale: 2
      t.decimal :dead_lift_p2, precision: 10, scale: 2
      t.decimal :dead_lift_p3, precision: 10, scale: 2
      t.decimal :hang_clean_p1, precision: 10, scale: 2
      t.decimal :hang_clean_p2, precision: 10, scale: 2
      t.decimal :hang_clean_p3, precision: 10, scale: 2

      t.integer :user_id

      t.timestamps
    end
  end
end
