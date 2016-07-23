class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :weight_kg, :decimal, precision: 10, scale: 2
    add_column :profiles, :height_m, :decimal, precision: 10, scale: 2
  end
end
