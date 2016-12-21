class CreateGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :groupings do |t|
      t.belongs_to :users, index: true
      t.belongs_to :groups, index: true
      t.timestamps
    end
  end
end
