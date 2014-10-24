class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :description
      t.text :tried_description
      t.integer :user_id
      t.boolean :resolved

      t.timestamps
    end
  end
end
