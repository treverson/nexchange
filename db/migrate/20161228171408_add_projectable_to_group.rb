class AddProjectableToGroup < ActiveRecord::Migration[5.0]
  def change
    add_reference :groups, :projectable, polymorphic: true, index: true
  end
end
