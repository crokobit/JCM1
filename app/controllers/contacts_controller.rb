class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy, :show]

  def index
    @contacts = Contact.all  
  end

  def new
    @contact = Contact.new  
  end

  def create
    @contact = Contact.create(email: params[:contact][:email]) 
    assign_agent(params[:contact][:agent])

    redirect_to contacts_path
  end

  def edit; end

  def update
    @contact.update(email: params[:contact][:email]) 
    assign_agent(params[:contact][:agent])

    redirect_to contacts_path
  end

  def destroy
    @contact.destroy

    redirect_to contacts_path
  end

  def show; end

  private

  def set_contact
    @contact = Contact.find(params[:id]) 
  end

  def assign_agent(id)
    if id.blank?
      @contact.agent_id = set_as_default_agent
    else
      @contact.agent_id = params[:contact][:agent]
    end
    @contact.save
  end

  def set_as_default_agent
    default_agent = Agent.find_by(name: "default")
    if default_agent.nil?
      Agent.create(name: "default")
      default_agent = Agent.find_by(name: "default")
    end

    default_agent.id
  end
end
