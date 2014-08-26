class AddAgentIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :agent_id, :integer
  end
end
