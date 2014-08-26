class AddDefaultContactIdToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :default_contact_id, :integer
  end
end
