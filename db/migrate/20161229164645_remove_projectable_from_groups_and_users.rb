class RemoveProjectableFromGroupsAndUsers < ActiveRecord::Migration[5.0]
  change_table :groups do |t|
    t.remove_references :projectable, :polymorphic => true
  end

  change_table :users do |t|
    t.remove_references :projectable, :polymorphic => true
  end
end
