class AddProjectableToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :projectable, polymorphic: true, index: true
  end
end
