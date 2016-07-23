class AddBuyNowToUsers < ActiveRecord::Migration
  def change
    add_column :users, :buy_now, :boolean
  end
end
