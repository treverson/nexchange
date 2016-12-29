class AddProjectableToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :projectable, polymorphic: true, index: true
  end
end
