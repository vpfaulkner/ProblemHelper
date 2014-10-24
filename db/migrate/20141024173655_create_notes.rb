class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :issue_id
      t.integer :user_id
      t.text :text

      t.timestamps
    end
  end
end
