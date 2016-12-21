class AddUserRefToGroupings < ActiveRecord::Migration[5.0]
  def change
    add_reference :groupings, :user, foreign_key: true
    add_reference :groupings, :group, foreign_key: true
  end
end
