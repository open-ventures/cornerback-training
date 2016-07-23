class AddPlanToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :manually_paid
    add_column :users, :plan, :integer, default: 0
  end
end
