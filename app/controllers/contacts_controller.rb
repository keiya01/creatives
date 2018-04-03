class ContactsController < ApplicationController
	before_action :brock_not_current_user

  def index
  	@contacts = Contact.page(params[:page]).per(15).order(created_at: 'DESC')
  end

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contents: params[:contents], user_id: @current_user.id)
  	if @contact.save
  		redirect_to "/", notice: "ありがとうございます!!"
  	else
  		render "contacts/new"
  	end
  end
end
