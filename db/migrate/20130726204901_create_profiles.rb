class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.date :dob
      t.string  :country
      t.integer :height_ft
      t.integer :height_in
      t.integer :weight
      t.integer :football_exp_level
      t.integer :weight_training_exp
      t.decimal :broad_jump_last, precision: 10, scale: 2
      t.decimal :broad_jump_pr, precision: 10, scale: 2
      t.decimal :yard_dash_40_last, precision: 10, scale: 2
      t.decimal :yard_dash_40_pr, precision: 10, scale: 2
      t.decimal :bench_press_225_last, precision: 10, scale: 2
      t.decimal :bench_press_225_pr, precision: 10, scale: 2
      t.decimal :short_shuttle_last, precision: 10, scale: 2
      t.decimal :short_shuttle_pr, precision: 10, scale: 2
      t.decimal :l_drill_last, precision: 10, scale: 2
      t.decimal :l_drill_pr, precision: 10, scale: 2
      t.decimal :vertical_jump_last, precision: 10, scale: 2
      t.decimal :vertical_jump_pr, precision: 10, scale: 2
      t.decimal :bench_press_last, precision: 10, scale: 2
      t.decimal :bench_press_pr, precision: 10, scale: 2
      t.decimal :back_squat_last, precision: 10, scale: 2
      t.decimal :back_squat_pr, precision: 10, scale: 2
      t.decimal :dead_lift_last, precision: 10, scale: 2
      t.decimal :dead_lift_pr, precision: 10, scale: 2
      t.decimal :hang_clean_last, precision: 10, scale: 2
      t.decimal :hang_clean_pr, precision: 10, scale: 2

      t.timestamps
    end
  end
end
