class AddManuallyPaidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :manually_paid, :boolean, default: false
  end
end
