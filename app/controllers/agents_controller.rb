class AgentsController < ApplicationController
  before_action :set_agent, only: [:edit, :update, :destroy, :show, :set_default_contact]

  def index
    @agents = Agent.all
  end

  def new
    @agent = Agent.new    
  end

  def create
    @agent = Agent.create(name: params[:agent][:name])
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

  def set_default_contact
    @agent.update(default_contact_id: params[:contact_id])
    redirect_to agent_path(params[:id])
  end

  private

  def set_agent
    @agent = Agent.find(params[:id])
  end
end
