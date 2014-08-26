class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy, :show]

  def index
    @contacts = Contact.all  
  end

  def new
    @contact = Contact.new  
  end

  def create
    unless params[:contact][:agent].blank?
      @contact = Contact.create(email: params[:contact][:email]) 
      @contact.assign_agent(params[:contact][:agent])
    end

    redirect_to contacts_path
  end

  def edit; end

  def update
    @contact.update(email: params[:contact][:email]) 
    @contact.assign_agent(params[:contact][:agent])

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

end
