class AgentsController < ApplicationController
  before_action :set_agent, only: [:edit, :update, :destroy, :show]
  def index
    @agents = Agent.all
  end
  def new
    @agent = Agent.new    
  end
  def create
    @agent = Agent.create(name: params[:agent][:name])
    set_default_contact(@agent)
    redirect_to agents_path
  end
  def edit; end
  def update
    @agent.update(name: params[:agent][:name])
    redirect_to agents_path
  end
  def destroy
    @agent.contacts.each.map(&:destroy)
    @agent.destroy
    redirect_to agents_path
  end
  def show; end

  private

  def set_agent
    @agent = Agent.find(params[:id])
  end

  def set_default_contact(agent)
    agent.contacts.create(email: "#{agent.name}-default@gmail.com")
  end
end
