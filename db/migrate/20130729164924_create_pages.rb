class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :slug
      t.integer :access

      t.timestamps
    end
  end
end
