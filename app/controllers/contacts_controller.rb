class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts # , methods: :birthdate_br

    # only = traga somente (...)
    # except = não traga (...)
    # render json: @contacts, only: [:name, :email]
    # render json: @contacts, except: [:created_at]

    # forma tradicional com map, add atributo novo
    # render json: @contacts.map{|contact|
    #   contact.attributes.merge({ author: "Barretin"})
    # }

    # forma mais interessante que o map
    # com methods basta criar o metodo no model
    # com as_json fica global o methods
    # render json: @contacts, methods: :author
  end

  # GET /contacts/1
  def show
    render json: @contact, include: [:kind, :phones]
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, include: [:kind, :phones], status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact, include: [:kind, :phones]
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(
        :name,
        :email,
        :birthdate,
        :kind_id,
        phones_attributes: [:id, :number, :_destroy]
      )
    end
end
