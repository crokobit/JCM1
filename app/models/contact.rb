class Contact < ActiveRecord::Base
  belongs_to :agent

  def assign_agent(id)
    self.agent_id = id
    self.save
  end
end
